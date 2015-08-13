
# S3 CORS upload

# http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html#how-do-i-enable-cors
# http://www.ioncannon.net/programming/1539/direct-browser-uploading-amazon-s3-cors-fileapi-xhr2-and-signed-puts/
# https://github.com/carsonmcdonald/direct-browser-s3-upload-example

class window.S3Upload
  with_credentials: false

  onFinishS3Put: (public_url) ->
    console.log 'base.onFinishS3Put()', public_url

  onProgress: (percent, status) ->
    console.log 'base.onProgress()', percent, status

  onError: (status) ->
    console.log 'base.onError()', status

  # Don't override these

  constructor: (options = {}) ->
    @[option] = options[option] for option of options
    @handleFileSelect(@file)

  handleFileSelect: (file) ->
    @onProgress 0, 'Upload started.'
    @uploadFile(file)

  createCORSRequest: (method, url) ->
    xhr = new XMLHttpRequest()
    if xhr.withCredentials?
      xhr.open method, url, true
    else if typeof XDomainRequest != "undefined"
      xhr = new XDomainRequest()
      xhr.open method, url
    else
      xhr = null
    xhr

  executeOnSignedUrl: (file, callback) ->
    object_name = "uploads/#{file.size}_#{new Date().getTime()}_#{file.name.replace(/\ /ig,'_')}"
    this_s3upload = this

    xhr = new XMLHttpRequest()
    xhr.withCredentials = @with_credentials
    xhr.open 'GET', @s3_sign_put_url + '?s3_object_type=' + @getFileType(file) + '&s3_object_name=' + object_name, true

    # Hack to pass bytes through unprocessed.
    xhr.overrideMimeType 'text/plain; charset=x-user-defined'

    xhr.onreadystatechange = (e) ->
      if this.readyState == 4 and this.status == 200
        try
          result = JSON.parse this.responseText
        catch error
          this_s3upload.onError 'Signing server returned some ugly/empty JSON: "' + this.responseText + '"'
          return false
        callback decodeURIComponent(result.signed_request), result.url
      else if this.readyState == 4 and this.status != 200
        this_s3upload.onError 'Could not contact request signing server. Status = ' + this.status
    xhr.send()

  # Use a CORS call to upload the given file to S3. Assumes the url
  # parameter has been signed and is accessible for upload.
  uploadToS3: (file, url, public_url) ->
    this_s3upload = this

    xhr = @createCORSRequest 'PUT', url
    if !xhr
      @onError 'CORS not supported'
    else
      xhr.onload = ->
        if xhr.status == 200
          this_s3upload.onProgress 100, 'Upload completed.'
          this_s3upload.onFinishS3Put public_url
        else
          this_s3upload.onError 'Upload error: ' + xhr.status

      xhr.onerror = ->
        this_s3upload.onError 'XHR error.'

      xhr.upload.onprogress = (e) ->
        if e.lengthComputable
          percentLoaded = Math.round (e.loaded / e.total) * 100
          this_s3upload.onProgress percentLoaded, if percentLoaded == 100 then 'Finalizing.' else 'Uploading.'

    file_type = @getFileType(file)
    xhr.setRequestHeader 'Content-Type', file_type
    xhr.setRequestHeader 'x-amz-acl', 'public-read'

    xhr.send file

  uploadFile: (file) ->
    this_s3upload = this
    @executeOnSignedUrl file, (signedURL, publicURL) ->
      this_s3upload.uploadToS3 file, signedURL, publicURL

  getFileType: (file) ->
    file.type || "application/octet-stream"

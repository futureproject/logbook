class ds.UploaderView extends Backbone.View
  events:
    "change": "upload"

  upload: (e) ->
    new S3Upload
      el: @el
      s3_sign_put_url: ds.apiHelper.urlFor('assets_s3_path')
      onProgress: (percent, message) ->
        console.log 'Upload progress: ', percent, message # Use this for live upload progress bars
      onFinishS3Put: (public_url) ->
        console.log 'Upload finished: ', public_url # Get the URL of the uploaded file
      onError: (status) ->
        console.log 'Upload error: ', status

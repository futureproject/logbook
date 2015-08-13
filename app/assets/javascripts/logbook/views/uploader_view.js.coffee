class ds.UploaderView extends Backbone.View
  events:
    "change": "batchUpload"

  batchUpload: (e) ->
    @initMeters()
    @upload(file) for file in @el.files

  upload: (file) ->
    $meter = $("<div class='progress-meter' />")
    @$meters.append $meter
    new S3Upload
      file: file
      s3_sign_put_url: ds.apiHelper.urlFor('assets_s3_path')
      onProgress: (percent, message) =>
        $meter.css("width", "#{percent}%")
      onFinishS3Put: (public_url) =>
        console.log "Uploaded #{public_url}"
        $meter.remove()
      onError: (status) ->
        console.log 'Upload error: ', status

  initMeters: ->
    return if @$meters
    @$meters = $("<div class='progress-meters' />")
    @$el.after @$meters


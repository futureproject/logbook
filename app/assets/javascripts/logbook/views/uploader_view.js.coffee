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
        $meter.replaceWith("<div class='upload'>#{file.type} - #{file.name}</div>")
        Backbone.trigger 'upload:finished', public_url
      onError: (status) ->
        console.log 'Upload error: ', status

  initMeters: ->
    return if @$meters
    @$meters = $("<div class='progress-meters' />")
    @$el.parent().append @$meters


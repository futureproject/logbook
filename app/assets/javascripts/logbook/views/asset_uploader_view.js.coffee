class ds.AssetUploaderView extends Backbone.View
  initialize: (args) ->
    @file = args.file
    @attachable = args.attachable
    throw "Needs a model and attachment" unless @attachable && @file
    @$meter = $("<div class='meter' />")
    @show()
    @upload()

  className: 'attachable'

  render: ->
    @$el.append @$meter
    @

  show: ->
    $('body').append @render().el

  upload: ->
    new S3Upload
      file: @file
      s3_sign_put_url: ds.apiHelper.urlFor('assets_s3_path')
      onProgress: (percent, message) =>
        @$meter.css("width", "#{percent}%")
      onFinishS3Put: (public_url) =>
        @$meter.replaceWith("<div class='upload'>Victory! Uploaded #{@file.name}.</div>")
        @attachable.trigger 'upload:finished', public_url
        # save an asset with this url, plus the attachable from the model
        asset = new ds.Asset
          attachable_type: ds.nounsHelper.constantize(@attachable.namespace)
          attachable_id: @attachable.id
          external_url: public_url
        asset.save()
        setTimeout =>
          @$el.fadeOut () => @remove()
        , 3000
      onError: (status) ->
        console.log 'Upload error: ', status



class ds.UploaderView extends Backbone.View
  initialize: (args) ->
    @file = args.file
    @attachable = args.attachable
    @model ||= @attachable
    throw "Needs a model and file" unless @model && @file
    @$meter = $("<div class='meter'>")
    @show()
    @upload()

  className: 'attachable'

  render: ->
    @$el.append(@$meter)
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
        @$meter.replaceWith("<div class='upload'>Uploaded #{@file.name}!</div>")
        @model.trigger 'upload:finished', public_url
        # save an asset with this url, plus the attachable from the model
        if @attachable
          asset = new ds.Asset
            attachable_type: ds.nounsHelper.constantize(@attachable.namespace)
            attachable_id: @attachable.id
            external_url: public_url
          asset.save()
        Backbone.trigger "notification", "Uploaded #{@file.name}!"
        @hide()
      onError: (status) ->
        console.log 'Upload error: ', status


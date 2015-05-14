Phonebook.Views.Assets ||= {}

class Phonebook.Views.Assets.ModelAssetsView extends Backbone.View
  initialize: (args) ->
    window.model = @model
    @listenTo @model, 'change:assets', @reset
    @collection = new Phonebook.Collections.AssetsCollection
    @listenTo @collection, 'add reset', @render
    @reset()

  template: JST['phonebook/templates/base/assets']

  reset: ->
    @collection.reset @model.get('assets')

  render: ->
    @trigger 'cleanup'
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new Phonebook.Views.Assets.AssetView
        model: model
      view.listenTo @, 'cleanup', view.remove
      fragment.appendChild view.render().el
    $(fragment).prepend($('#form-to-s3').html()).prepend(@template())
    @$el.html(fragment)
    @prepS3Form()
    @

  remove: ->
    @trigger 'cleanup'
    super

  prepS3Form: ->
    @$form = @$el.find('form')
    @$form.attr('data-attachable-id', @model.get('id'))
    @$form.attr('data-attachable-type', @model.className)
    @$form.S3Uploader(
      additional_data:
        asset:
          attachable_id: @$form.attr('data-attachable-id')
          attachable_type: @$form.attr('data-attachable-type')
    )
    @$form.on('ajax:complete', @parseAsset)

  parseAsset: (e, data) =>
    assetAttrs = JSON.parse data.responseText
    @collection.add assetAttrs,
      at: 0

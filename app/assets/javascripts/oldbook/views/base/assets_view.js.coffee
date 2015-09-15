Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.AssetsView extends Backbone.View
  initialize: (args) ->
    @listenTo @model, 'change:assets', -> @collection.reset(@model.get('assets'))
    @collection = new Phonebook.Collections.AssetsCollection
    @listenTo @collection, 'reset', @render

  template: JST['oldbook/templates/base/assets']

  render: ->
    @trigger 'cleanup'
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new Phonebook.Views.Base.AssetView
        model: model
      view.listenTo @, 'cleanup', view.remove
      fragment.appendChild view.render().el
    $(fragment).prepend(@template()).append($('#form-to-s3').html())
    @prepS3Form()
    @$el.html(fragment)
    @

  remove: ->
    @trigger 'cleanup'
    super

  prepS3Form: ->
    @$form = @$el.find('form')
    @$form.attr('data-attachable-id', @model.get('id'))
    @$form.attr('data-attachable-type', 'Engagement')
    @$form.S3Uploader(
      additional_data:
        asset:
          attachable_id: @$form.attr('data-attachable-id')
          attachable_type: @$form.attr('data-attachable-type')
    )
    @$form.on('ajax:complete', @parseAsset)

  parseAsset: (e, data) =>
    assetAttrs = JSON.parse data.responseText
    if !!assetAttrs.external_url.match(/jpg|gif|png/i)
      assetAttrs.thumbnail = assetAttrs.external_url
    @model.assetsCollection.add assetAttrs,
      at: 0

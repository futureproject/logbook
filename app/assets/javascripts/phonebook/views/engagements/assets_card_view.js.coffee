Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AssetsCardView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @model.assetsCollection = new Phonebook.Collections.AssetsCollection
    @render()
    @listenTo @model.assetsCollection, 'add reset', @renderAssets

  template: JST['phonebook/templates/engagements/assets_card']

  render: ->
    @model.assetsCollection.reset @model.get('assets')
    @$thumbs = $('<div class="thumbnails" />')
    @renderAssets()
    @$el.html(@template @model.tplAttrs())
    @$el.append($('#form-to-s3').html()).append(@$thumbs)
    @prepS3Form()
    @

  renderAssets: ->
    @$thumbs.empty()
    @model.assetsCollection.each (asset) => @addAsset(asset)

  addAsset: (asset) ->
    v = new Phonebook.Views.Assets.AssetView
      model: (asset)
    v.listenTo Backbone, 'assets:clean', v.remove
    @$thumbs.append v.render().el

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

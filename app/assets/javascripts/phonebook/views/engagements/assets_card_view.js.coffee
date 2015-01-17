Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AssetsCardView extends Backbone.View
  template: JST['phonebook/templates/engagements/assets_card']

  render: ->
    @$thumbs = $('<div class="thumbnails" />')
    @renderAssets()
    @$el.html(@template @model.tplAttrs())
    @$el.append($('#form-to-s3').html()).append(@$thumbs)
    @prepS3Form()
    @

  renderAssets: ->
    assets = @model.get('assets')
    Backbone.trigger 'assets:clean'
    i = assets.length
    while (i > 0)
      @addAsset(assets[i])
      i -= 1

  addAsset: (asset) ->
    v = new Phonebook.Views.Assets.AssetView
      model: new Phonebook.Models.Asset(asset)
    v.listenTo Backbone, 'assets:clean', v.remove
    @$thumbs.prepend v.render().el

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
    @addAsset(assetAttrs)

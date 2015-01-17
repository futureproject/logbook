Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AssetsCardView extends Backbone.View
  render: ->
    @$list = $('<ul class="thumbnails" />')
    @$el.append($('#form-to-s3').html()).append(@$list)
    @renderAssets()
    @prepS3Form()
    @

  renderAssets: ->
    assets = @model.get('assets')
    Backbone.trigger 'assets:clean'
    i = assets.length
    while (i -= 1)
      @addAsset(assets[i])

  addAsset: (asset) ->
    v = new Phonebook.Views.Assets.AssetView
      model: new Phonebook.Models.Asset(asset)
    v.listenTo Backbone, 'assets:clean', v.remove
    @$list.prepend v.render().el

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
    else
      assetAttrs.thumbnail = "//dream-os-production.s3.amazonaws.com/static-assets/document.png"
    @addAsset(assetAttrs)

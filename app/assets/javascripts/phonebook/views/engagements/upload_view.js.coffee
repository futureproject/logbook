Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.UploadView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/engagements/upload']

  className: 'detail detail-upload'

  listen: ->

  events:
    'tap .done': 'done'
    'touchmove .titlebar': (e) -> e.preventDefault()

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      @loadUploads()

  hide: (animation) ->
    animation ||= 'slide-out-vertical'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )

  done: (e) -> @hide()

  render: ->
    @$el.html @template @model.tplAttrs()

  loadUploads: ->
    assets = @model.get('assets')
    fragment = document.createDocumentFragment()
    _.each assets, (asset) ->
      v = new Phonebook.Views.Assets.AssetView
        model: new Phonebook.Models.Asset(asset)
      v.listenTo Backbone, 'uploads:clean', v.remove
      fragment.appendChild v.render().el
    @$el.find('.engagement-assets').html(fragment).before $('#form-to-s3').html()
    @prepS3Form()

  removeSubviews: ->
    @$form?.unbind().remove()
    Backbone.trigger 'uploads:clean'

  remove: ->
    @removeSubviews()
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
    @$form.on('ajax:complete', @addAsset)

  addAsset: (e, data) =>
    assetAttrs = JSON.parse data.responseText
    if !!assetAttrs.external_url.match(/jpg|gif|png/i)
      assetAttrs.thumbnail = assetAttrs.external_url
    else
      assetAttrs.thumbnail = "//dream-os-production.s3.amazonaws.com/static-assets/document.png"
    a = new Phonebook.Models.Asset(assetAttrs)
    v = new Phonebook.Views.Assets.AssetView
      model: a
    v.listenTo Backbone, 'uploads:clean', v.remove
    @$el.find('.engagement-assets').prepend(v.render().el)


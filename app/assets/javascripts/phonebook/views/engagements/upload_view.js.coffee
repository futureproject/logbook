Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.UploadView extends Backbone.View
  initialize: (args) ->
    @listen()

  template: JST['phonebook/templates/engagements/upload']

  listen: ->
    @listenTo Backbone, 'engagements:uploading', @show
    @listenTo Backbone, 'engagements:selected', @hide

  events:
    'tap .done': 'animateOut'
    'touchmove .detail-title': (e) -> e.preventDefault()

  show: (model) ->
    @model = model
    #return if @model?.has('uploading')
    Backbone.trigger 'engagements:router:update', "#{@model.get('id')}/upload"
    @model.set 'uploading', true
    @render()
    @animateIn()
    @loadUploads()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset('uploading')
    @removeSubviews()
    @$el.removeClass('active').attr('style','') #reset CSS styles

  render: ->
    @$el.html @template @model.tplAttrs()

  animateIn: ->
    @$el.addClass('active')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  loadUploads: ->
    $.ajax
      url: ds.apiHelper.urlFor 'engagement', @model.get('id')
      complete: (response) =>
        response = JSON.parse(response.responseText)
        assets = response.assets
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


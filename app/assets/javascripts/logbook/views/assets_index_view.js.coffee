class ds.AssetsIndexView extends Backbone.View
  initialize: ->
    @state =
      page: 1
    @collection = ds.collections.assets
    @views =
      gallery: new ds.AssetsGalleryView
        collection: @collection

  template: JST["logbook/templates/assets_index"]

  events:
    'click a[rel=next]': 'nextPage'

  render: ->
    @$el.html(@template())
    @postRender()
    @

  postRender: ->
    @views.gallery.renderTo "#assets-gallery"

  nextPage: ->
    page = @state.page + 1
    $.ajax
      url: @collection.url()
      dataType: 'json'
      data:
        page: page
      success: (response) =>
        if @collection.add(response.data)
          @state.page += 1
        else
          @$el.find('.assets-pagination').remove()

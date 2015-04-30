Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.IndexView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @collection = args.collection
    @listenTo Backbone, 'view:shown', @onViewShow
    @listenTo Backbone, 'searchView:in', @onSearchIn
    @listenTo Backbone, 'searchView:out', @onSearchOut
    @rendered = false
    @table = new Phonebook.Views.Base.TableView(
      collection: @collection
      item_view: Phonebook.Views.Projects.RowView
    )
    @searchBar = new Phonebook.Views.Base.SearchView
      collection: @collection
      enablingEvents: 'projects:index'
      disablingEvents: 'projects:show'

  template: JST['phonebook/templates/projects/index']

  className: 'table'

  events:
    'touchend .new': 'newOrCloseSearch'
    'touchmove .titlebar': (e) -> e.preventDefault()
    'click .titlebar h1': (e) -> @$('.scrollable').animate({ scrollTop: 0 })

  render: ->
    @$el.html @template
    @$container.append @$el
    @table.setElement('#projects-table').render()
    @searchBar.setElement('#projects-search-field')
    @rendered = true

  renderOnce: ->
    return if @rendered
    @render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @searchBar?.remove()
    @table?.remove()

  show: ->
    @renderOnce()
    Backbone.trigger 'projects:router:update', 'phonebook/projects'
    @$el.addClass('active')
    @unslide()

  hide: ->
    @$el.removeClass('active')

  slide: -> @$el.addClass('shifted')
  unslide: -> @$el.removeClass('shifted')

  onViewShow: (type) ->
    @slide() if type == 'detail'

  newOrCloseSearch: ->
    if @searching then @searchBar.$el.blur() else Backbone.trigger 'projects:new'

  onSearchIn: (e) ->
    @searching = true
    @$el.find('.button.new').addClass('searching')
  onSearchOut: (e) ->
    @searching = false
    @$el.find('.button.new').removeClass('searching')

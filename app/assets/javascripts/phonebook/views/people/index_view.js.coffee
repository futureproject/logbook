Phonebook.Views.People ||= {}

class Phonebook.Views.People.IndexView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @collection = args.collection
    @listenTo Backbone, 'view:shown', @onViewShow
    @rendered = false
    @table = new Phonebook.Views.Base.TableView(
      collection: @collection
      item_view: Phonebook.Views.People.RowView
    )
    @searchBar = new Phonebook.Views.Base.SearchView
      collection: @collection
      container: @$el.find('.titlebar')
      hidingEvents: 'people:show'

  template: JST['phonebook/templates/people/index']

  className: 'table'

  events:
    'touchend .new': 'newOrCloseSearch'
    'touchend .icon-search': 'toggleSearchBar'
    'click .icon-search': 'focusSearchBar'
    'touchmove .titlebar': (e) -> e.preventDefault()
    'click .titlebar h1': (e) -> @$('.scrollable').animate({ scrollTop: 0 })

  render: ->
    @$el.html @template
    @$container.append @$el
    @table.setElement('#people-table').render()
    @searchBar.setElement('#people-search-container').render()
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
    Backbone.trigger 'people:router:update', 'phonebook/people'
    @$el.addClass('active')
    @unslide()

  hide: ->
    @$el.removeClass('active')

  slide: -> @$el.addClass('shifted')
  unslide: -> @$el.removeClass('shifted')

  onViewShow: (type) ->
    @slide() if type == 'detail'

  newOrCloseSearch: (event) ->
    event.preventDefault()
    if @searchBar.showing then @toggleSearchBar() else Backbone.trigger('people:new')

  toggleSearchBar: () ->
    @searchBar.toggle()

  focusSearchBar: (event) ->
    event.preventDefault()
    @searchBar.$input.focus() if @searchBar.showing

Phonebook.Views.People ||= {}

class Phonebook.Views.People.IndexView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @collection = args.collection
    @listenTo Backbone, 'people:views:shown', @onViewShow
    @rendered = false
    @table = new Phonebook.Views.Base.TableView(
      collection: @collection
      item_view: Phonebook.Views.People.RowView
    )

  template: JST['phonebook/templates/people/index']

  className: 'table'

  events:
    'touchend .new': (e) ->
      e.preventDefault()
      Backbone.trigger 'people:new'
    'touchmove .titlebar': (e) -> e.preventDefault()

  render: ->
    @$el.html @template
    @$container.append @$el
    @table.setElement('#people-table').render()
    @rendered = true

  renderOnce: ->
    return if @rendered
    @render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @table?.remove()

  show: ->
    @renderOnce()
    Backbone.trigger 'people:router:update', 'phonebook'
    @$el.addClass('active')
    @unslide()

  hide: ->
    @$el.removeClass('active')

  slide: -> @$el.addClass('shifted')
  unslide: -> @$el.removeClass('shifted')

  onViewShow: (type) ->
    @slide() if type == 'detail'

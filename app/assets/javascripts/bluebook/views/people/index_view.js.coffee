Bluebook.Views.People ||= {}

class Bluebook.Views.People.IndexView extends Backbone.View
  template: JST["bluebook/templates/people/index"]

  initialize: (options) ->
    @list = new Bluebook.Views.People.List
    @filters = new Bluebook.Views.People.Filters
    @listenTo Backbone, 'people:models', @render

  render: (models) ->
    @$el.html(@template())
    @list.setElement(this.$('.list-items')).render(models)
    @filters.setElement($('.button-group')).render()
    return this

class Bluebook.Views.People.List extends Backbone.View
  initialize: (options) ->
    @listenTo Backbone, 'people:scrollTo', @scrollTo
    @listenTo Backbone, 'people:sort', @render

  events:
    'touchstart': 'onScrollStart'
    'touchmove': 'onScrollMove'

  onScrollStart: (e) ->
    height = @el.getBoundingClientRect().height
    atTop = @el.scrollTop == 0
    atBottom = (@el.scrollHeight - @el.scrollTop == height)
    if atTop
      @el.scrollTop += 1
    else if atBottom
      @el.scrollTop -= 1

  onScrollMove: (e) ->
    e.stopPropagation()

  addBatch: (models) ->
    @fragment = document.createDocumentFragment()
    @addOne(person) for person in models
    @el.appendChild(@fragment)

  addOne: (person) ->
    view = new Bluebook.Views.People.PersonView({model : person})
    @fragment.appendChild(view.render().el)

  render: (models) ->
    @models = models
    @$el.empty()
    @addBatch(models.slice(0,20))
    setTimeout () =>
      @addBatch(models.slice(20,models.length))
    , 300
    return this

  scrollTo: (pos) ->
    @el.scrollTop = pos - 60

class Bluebook.Views.People.Filters extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'people:filter', @onFilter

  render: ->
    @$(@active_filter).addClass('active').siblings().removeClass('active')

  events: ->
    'click .core' : (e) => @onclick(e, { core: true}, '/bluebook/people/' )
    'click .students' : (e) => @onclick(e, { role: 'student'}, '/bluebook/people/by_role/student')
    'click .faculty' : (e) => @onclick(e, { role: 'faculty'}, '/bluebook/people/by_role/faculty')

  onclick: (event, filter, route) ->
    return if event.target.classList.contains 'active'
    Backbone.trigger 'people:filter', null, null, filter
    Backbone.trigger 'peopleRouter:go', route

  onFilter: (collection, info, filter) ->
    if filter.core?
      @active_filter = '.core'
    else if filter.role == 'student'
      @active_filter = '.students'
    else if filter.role == 'faculty'
      @active_filter = '.faculty'
    @render()


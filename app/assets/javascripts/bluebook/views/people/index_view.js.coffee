Bluebook.Views.People ||= {}

class Bluebook.Views.People.IndexView extends Backbone.View
  template: JST["bluebook/templates/people/index"]

  initialize: (options) ->
    @list = new Bluebook.Views.People.List
    @filters = new Bluebook.Views.People.Filters
    @listenTo Backbone, 'people:models', @render

  render: (models) ->
    console.log models.length
    @$el.html(@template())
    @list.setElement(this.$('.list-items')).render(models)
    @filters.setElement($('.button-group')).render()
    return this

class Bluebook.Views.People.List extends Backbone.View
  initialize: (options) ->
    @listenTo Backbone, 'people:scrollTo', @scrollTo
    @listenTo Backbone, 'people:sort', @render

  addAll: (models) =>
    _.each models, @addOne

  addOne: (person) =>
    view = new Bluebook.Views.People.PersonView({model : person})
    @fragment.appendChild(view.render().el)

  render: (models) ->
    @fragment = document.createDocumentFragment()
    @$el.empty()
    @addAll(models)
    @el.appendChild(@fragment)
    return this

  scrollTo: (pos) ->
    @el.scrollTop = pos - 60

class Bluebook.Views.People.Filters extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'people:filter', @onFilter

  render: ->
    @$(@active_filter).addClass('active').siblings().removeClass('active')

  events: ->
    'click .core' : (e) => @onclick(e, { core: true}, '/bluebook/people' )
    'click .students' : (e) => @onclick(e, { role: 'student'}, '/bluebook/people/by_role/student')
    'click .faculty' : (e) => @onclick(e, { role: 'faculty'}, '/bluebook/people/by_role/faculty')

  onclick: (event, filter, route) ->
    return if event.target.classList.contains 'active'
    Backbone.trigger 'people:filter', null, null, filter
    Backbone.trigger 'route:go', route

  onFilter: (collection, info, filter) ->
    if filter.core?
      @active_filter = '.core'
    else if filter.role == 'student'
      @active_filter = '.students'
    else if filter.role == 'faculty'
      @active_filter = '.faculty'
    @render()


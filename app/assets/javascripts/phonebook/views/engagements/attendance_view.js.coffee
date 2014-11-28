Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceView extends Backbone.View
  initialize: ->
    @$search = new Phonebook.Views.People.SearchView
      url: ds.apiHelper.urlFor 'people'
    @listen()

  template: JST['phonebook/templates/engagements/attendance']

  listen: ->
    @listenTo Backbone, 'engagements:taking_attendance', @show
    @listenTo Backbone, 'engagements:selected', @hide
    @listenTo Backbone, 'people:search:complete', @showResults
    @listenTo Backbone, 'people:search:clear', @hideResults

  events:
    'tap .done': 'animateOut'
    'touchmove .detail-title': (e) -> e.preventDefault()

  show: (model) ->
    @model = model
    Backbone.trigger 'engagements:router:update', "#{@model.get('id')}/attendance"
    @model.set 'taking_attendance', true
    @render()
    @$search.setElement '#engagement-attendance-search-form'
    @animateIn()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset 'taking_attendance'
    @removeSubviews()
    @$el.removeClass('active').attr('style','')

  render: ->
    @$el.html @template @model.tplAttrs()

  animateIn: ->
    @$el.addClass('active')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  removeSubviews: ->
    @search?.remove()

  remove: ->
    @removeSubviews()
    super

  showResults: (data) ->
    frag = document.createDocumentFragment()
    _.each data.results, (result) =>
      v = new Phonebook.Views.People.AttendingPersonView
        model: new Phonebook.Models.Person(result)
      frag.appendChild v.render().el
    @$el.find('.search-results').html frag

  hideResults: ->
    @$el.find('.search-results').unbind().empty()

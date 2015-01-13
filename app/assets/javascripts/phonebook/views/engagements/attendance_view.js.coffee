Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceView extends Backbone.View
  initialize: ->
    @listen()

  template: JST['phonebook/templates/engagements/attendance']

  listen: ->
    @listenTo Backbone, 'engagements:taking_attendance', @show
    @listenTo Backbone, 'engagements:selected', @hide
    @listenTo Backbone, 'engagements:attendee_ids', @updateAttendees

  events:
    'tap .done': 'animateOut'
    'touchmove .detail-title': (e) -> e.preventDefault()

  show: (model) ->
    @model = model
    Backbone.trigger('engagements:router:update', "#{@model.get('id')}/attendance") unless @model.isNew()
    @model.set 'taking_attendance', true
    @render()
    @search = new Phonebook.Views.People.SearchView
      url: ds.apiHelper.urlFor 'people'
      el: '#engagement-attendance-search-form'
    @search_results = new Phonebook.Views.Engagements.SearchResultsView
      el: '#engagement-search-results'
    @attendees_list = new Phonebook.Views.Engagements.AttendeesListView
      el:'#engagement-attendees-list'
    @loadAttendeesFromServer()
    @animateIn()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset 'taking_attendance'
    @removeSubviews()
    @$el.removeClass('active').attr('style','')

  render: ->
    @$el.html @template @model.tplAttrs()

  animateIn: ->
    @$el.addClass('active').one('webkitTransitionEnd', (event) =>
      @$el.find('input').focus()
    )

  animateOut: ->
    document.activeElement?.blur()
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  removeSubviews: ->
    @search?.remove()
    @search_results?.remove()
    @attendees_list?.remove()
    Backbone.trigger 'attendees:clean'

  remove: ->
    @removeSubviews()
    super

  updateAttendees: (ids) ->
    @model.save
      attendee_ids: ids

  loadAttendeesFromServer: ->
    if @model.isNew()
      Backbone.trigger 'engagement_attendees:loaded', []
    else
      $.ajax
        url: ds.apiHelper.urlFor 'engagement_attendees', @model.get('id')
        complete: (response) =>
          attendees = JSON.parse response.responseText
          Backbone.trigger 'engagement_attendees:loaded', attendees


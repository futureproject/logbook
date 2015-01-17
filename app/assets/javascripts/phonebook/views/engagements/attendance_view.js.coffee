Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/engagements/attendance']

  className: 'detail detail-attendance'

  listen: ->
    @listenTo Backbone, 'engagements:attendee_ids', @updateAttendees

  events:
    'tap .done': 'done'
    'touchmove .detail-title': (e) -> e.preventDefault()

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      @$el.find('input').focus()
    @search = new Phonebook.Views.People.SearchView
      url: ds.apiHelper.urlFor 'people'
      el: '#engagement-attendance-search-form'
    @search_results = new Phonebook.Views.Engagements.SearchResultsView
      el: '#engagement-search-results'
    @attendees_list = new Phonebook.Views.Engagements.AttendeesListView
      el:'#engagement-attendees-list'
    @loadAttendeesFromServer()
    Backbone.trigger 'engagements:views:shown', 'modal'

  hide: (animation) ->
    animation ||= 'slide-out-vertical'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
      window.scrollTo(0,0)
    )

  done: ->
    @hide()

  render: ->
    @$el.html @template @model.tplAttrs()

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


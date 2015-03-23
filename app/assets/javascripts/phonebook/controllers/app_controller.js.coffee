class Phonebook.Controllers.AppController extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'engagements:index', @showEngagements
    @listenTo Backbone, 'projects:index', @showProjects
    @listenTo Backbone, 'people:index', @showPeople
    @render()

  render: ->
    @$el.html(@template())
    @$el.addClass('standalone') if navigator.standalone
    @

  template: JST['phonebook/templates/app']

  events:
    'touchstart .scrollable' : 'fixScrollBounce'
    'touchend #engagements-tab': -> Backbone.trigger 'engagements:index'
    'touchend #people-tab': -> Backbone.trigger 'people:index'
    'touchend #projects-tab': -> Backbone.trigger 'projects:index'

  fixScrollBounce: (e) ->
    el = e.currentTarget
    height = el.getBoundingClientRect().height
    isAtTop = (el.scrollTop is 0)
    isAtBottom = (el.scrollHeight - el.scrollTop is height)
    if isAtTop or isAtBottom
      # adjust the scroll position by one pixel, which bypasses
      # the scroll bounce on the document body
      if isAtTop
        el.scrollTop += 1
      else el.scrollTop -= 1  if isAtBottom

  showProjects: ->
    @$el.find('#projects-tab').addClass('current').siblings().removeClass('current')

  showPeople: ->
    @$el.find('#people-tab').addClass('current').siblings().removeClass('current')

  showEngagements: ->
    @$el.find('#engagements-tab').addClass('current').siblings().removeClass('current')


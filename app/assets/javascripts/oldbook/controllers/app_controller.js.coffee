class Phonebook.Controllers.AppController extends Backbone.View
  initialize: ->
    @render()
    @controllers =
      engagements: new Phonebook.Controllers.EngagementsController
        el: '#phonebook-engagements'
      people: new Phonebook.Controllers.PeopleController
        el: '#phonebook-people'
      projects: new Phonebook.Controllers.ProjectsController
        el: '#phonebook-projects'
    @listenTo Backbone, 'controller:activate', @activateController

  render: ->
    @$el.html(@template())
    @$el.addClass('standalone') if navigator.standalone
    @

  template: JST['oldbook/templates/app']

  events:
    'touchstart .scrollable' : 'fixScrollBounce'
    'touchmove .tab-bar': (e) -> e.preventDefault()
    'touchend .tab': 'tabTap'

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

  activateController: (controller) ->
    for k,v of @controllers
      v.deactivate() unless @controllers[controller] == v
    @controllers[controller].activate()
    $("##{controller}-tab").addClass('current').siblings().removeClass('current')

  tabTap: (e) ->
    controller = e.target.getAttribute('data-controller')
    @activateController(controller)

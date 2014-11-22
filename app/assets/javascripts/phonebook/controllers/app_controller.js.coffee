class Phonebook.Controllers.AppController extends Backbone.View
  initialize: ->
    $(document).hammer({
      dragLockToAxis: true
      dragBlockHorizontal: true
      swipeVelocityX: 0.2
    })
    @render()

  render: ->
    @$el.html(@template())
    @$el.addClass('standalone') if navigator.standalone
    @

  template: JST['phonebook/templates/app']

  events:
    'touchstart .scrollable' : 'fixScrollBounce'

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

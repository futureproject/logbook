class Phonebook.Controllers.AppController extends Backbone.View
  initialize: ->
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
      # if the content is too short, put it all in a tall div
      if el.scrollHeight <= height
        scrollPad = document.createElement("div")
        scrollPad.style.minHeight = "100%"
        scrollPad.style.paddingBottom = "2px"
        scrollPad.innerHTML = el.innerHTML
        el.innerHTML = ""
        el.appendChild scrollPad
      # adjust the scroll position by one pixel, which bypasses
      # the scroll bounce on the document body
      if isAtTop
        el.scrollTop += 1
      else el.scrollTop -= 1  if isAtBottom

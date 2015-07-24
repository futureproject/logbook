window.ds ||= {}

class ds.GlobalAddTriggerView extends Backbone.View
  initialize: -> @listenTo Backbone, 'routed', @setCssClass

  el: '#global-add-trigger'
  events:
    'click': 'toggle'

  setCssClass: ->
    @$el.toggleClass('open', @isOpen())

  isOpen: -> !!location.pathname.match /new/i

  toggle: -> if @isOpen() then @close() else @open()

  open: ->
    ds.router.navigate "/logbook/people/new", { trigger: true }

  close: ->
    ds.router.navigate "/logbook", { trigger: true }

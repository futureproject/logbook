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
    @referrer = location.pathname
    path = @setPathFromLocation()
    ds.router.navigate path, { trigger: true }

  close: ->
    if @referrer && @referrer != location.pathname
      path = @referrer
    else
      path = @setPathFromLocation({ returning: true })
    ds.router.navigate path, { trigger: true }

  setPathFromLocation: (args) ->
    args ||= {}
    current_location = location.pathname
    default_path = if args.returning then "/logbook/dashboard" else "/logbook/engagements"
    new_location = switch
      when current_location.match(/people/i)
        "/logbook/people"
      when current_location.match(/engagements/i)
        "/logbook/engagements"
      when current_location.match(/projects/i)
        "/logbook/projects"
      else default_path
    new_location += "/new" unless args.returning
    new_location


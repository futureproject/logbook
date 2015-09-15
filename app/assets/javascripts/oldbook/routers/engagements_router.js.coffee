class Phonebook.Routers.EngagementsRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'engagements:router:update', @update

  routes:
    'oldbook/engagements/new': 'new'
    'oldbook/engagements/:id/edit': 'edit'
    'oldbook/engagements/:id/upload': 'upload'
    'oldbook/engagements/:id/attendance': 'attendance'
    'oldbook/engagements/:id': 'show'
    'oldbook': 'index'
    'oldbook/': 'index'
    'oldbook/engagements/': 'index'
    'oldbook/engagements': 'index'
    'logbookapp': 'index'
    'logbookapp/': 'index'

  index: ->
    Backbone.trigger 'controller:activate', 'engagements'
    Backbone.trigger 'engagements:index'

  show: (id) ->
    Backbone.trigger 'controller:activate', 'engagements'
    Backbone.trigger 'engagements:show', id, 'fade-in-fast'

  new: ->
    Backbone.trigger 'controller:activate', 'engagements'
    Backbone.trigger 'engagements:new', 'fade-in-fast'

  edit: (id) ->
    Backbone.trigger 'controller:activate', 'engagements'
    Backbone.trigger 'engagements:show', id, 'fade-in'
    Backbone.trigger 'engagements:edit', id, 'fade-in-fast'

  upload: (id) ->
    Backbone.trigger 'controller:activate', 'engagements'
    Backbone.trigger 'engagements:upload', id

  attendance: (id) ->
    Backbone.trigger 'controller:activate', 'engagements'
    Backbone.trigger 'engagements:attendance', id


  update: (url) ->
    return unless url?
    url = url.toString()
    if url.match(/oldbook/i)
      @navigate url
    else
      @navigate "oldbook/engagements/#{url}"

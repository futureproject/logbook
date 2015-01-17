class Phonebook.Routers.EngagementsRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'engagements:router:update', @update

  routes:
    'phonebook/engagements/new': 'new'
    'phonebook/engagements/:id/edit': 'edit'
    'phonebook/engagements/:id/upload': 'upload'
    'phonebook/engagements/:id/attendance': 'attendance'
    'phonebook/engagements/:id': 'show'
    'phonebook': 'index'
    'phonebook/': 'index'
    'phonebook/engagements/': 'index'
    'logbookapp': 'index'
    'logbookapp/': 'index'

  index: ->
    Backbone.trigger 'engagements:index'

  show: (id) ->
    Backbone.trigger 'engagements:show', id, 'fade-in-fast'

  new: ->
    Backbone.trigger 'engagements:new', 'fade-in-fast'

  edit: (id) ->
    Backbone.trigger 'engagements:show', id, 'fade-in'
    Backbone.trigger 'engagements:edit', id, 'fade-in-fast'

  upload: (id) ->
    Backbone.trigger 'engagements:upload', id

  attendance: (id) ->
    Backbone.trigger 'engagements:attendance', id


  update: (url) ->
    return unless url?
    url = url.toString()
    if url.match(/phonebook/i)
      @navigate url
    else
      @navigate "phonebook/engagements/#{url}"

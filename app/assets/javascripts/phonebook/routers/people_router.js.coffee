class Phonebook.Routers.PeopleRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'people:router:update', @update

  routes:
    'phonebook/people/new': 'new'
    'phonebook/people/:id/edit': 'edit'
    'phonebook/people/:id': 'show'
    'phonebook/people/': 'index'
    'phonebook/people': 'index'

  index: ->
    Backbone.trigger 'controller:activate', 'people'
    Backbone.trigger 'people:index'

  show: (id) ->
    Backbone.trigger 'controller:activate', 'people'
    Backbone.trigger 'people:show', id, 'fade-in-fast'

  new: ->
    Backbone.trigger 'controller:activate', 'people'
    Backbone.trigger 'people:new', 'fade-in-fast'

  edit: (id) ->
    Backbone.trigger 'controller:activate', 'people'
    Backbone.trigger 'people:show', id, 'fade-in'
    Backbone.trigger 'people:edit', id, 'fade-in-fast'

  update: (url) ->
    return unless url?
    url = url.toString()
    if url.match(/phonebook/i)
      @navigate url
    else
      @navigate "phonebook/people/#{url}"

class Phonebook.Routers.ProjectsRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'projects:router:update', @update

  routes:
    'phonebook/projects/new': 'new'
    'phonebook/projects/:id/edit': 'edit'
    'phonebook/projects/:id': 'show'
    'phonebook/projects/': 'index'
    'phonebook/projects': 'index'

  index: ->
    Backbone.trigger 'controller:activate', 'projects'
    Backbone.trigger 'projects:index'

  show: (id) ->
    Backbone.trigger 'controller:activate', 'projects'
    Backbone.trigger 'projects:show', id, 'fade-in-fast'

  new: ->
    Backbone.trigger 'controller:activate', 'projects'
    Backbone.trigger 'projects:new', 'fade-in-fast'

  edit: (id) ->
    Backbone.trigger 'controller:activate', 'projects'
    Backbone.trigger 'projects:show', id, 'fade-in'
    Backbone.trigger 'projects:edit', id, 'fade-in-fast'

  update: (url) ->
    return unless url?
    url = url.toString()
    console.log url
    if url.match(/phonebook/i)
      @navigate url
    else
      @navigate "phonebook/projects/#{url}"

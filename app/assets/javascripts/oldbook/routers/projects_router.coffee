class Phonebook.Routers.ProjectsRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'projects:router:update', @update

  routes:
    'oldbook/projects/new': 'new'
    'oldbook/projects/:id/edit': 'edit'
    'oldbook/projects/:id': 'show'
    'oldbook/projects/': 'index'
    'oldbook/projects': 'index'

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
    if url.match(/oldbook/i)
      @navigate url
    else
      @navigate "oldbook/projects/#{url}"

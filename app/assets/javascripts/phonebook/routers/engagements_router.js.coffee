class Phonebook.Routers.EngagementsRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'engagements:router:update', @update

  routes:
    'phonebook/engagements/new': 'new'
    'phonebook/engagements/:id/edit': 'edit'
    'phonebook/engagements/:id': 'show'
    'phonebook': 'index'
    'phonebook/': 'index'
    'phonebook/engagements/': 'index'

  index: ->
    Backbone.trigger 'engagements:index'

  show: (id) ->
    Backbone.trigger 'engagements:show', id

  edit: (id) ->
    Backbone.trigger 'engagements:edit', id

# this Route, unlike the rest, does not delegate to the engagements controller.
# instead, the new engagements view is listening directly.
# why? because new engagements need not be associated with the controller's collection
  new: ->
    Backbone.trigger 'engagements:new'

  update: (url) ->
    url = url.toString()
    if url.match(/phonebook/i)
      @navigate url
    else
      @navigate "phonebook/engagements/#{url}"
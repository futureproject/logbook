Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.DetailView extends Phonebook.Views.Base.DetailView

  template: JST['phonebook/templates/projects/detail']

  listen: ->
    @listenTo @model, 'change', @render
    @events['touchend .edit'] = (e) ->
      e.preventDefault()
      Backbone.trigger 'projects:edit', @model
    @events['click .trigger-edit'] = (e) ->
      e.preventDefault()
      Backbone.trigger 'projects:edit', @model

  show: (animation) ->
    Backbone.trigger 'projects:router:update', (@model.id || @model.cid)
    Backbone.trigger 'projects:views:shown', 'detail'
    super

  hide: (animation) ->
    Backbone.trigger('projects:views:hidden', @)
    super

  renderSubviews: ->
    console.log @model.attributes

  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'projects:index'


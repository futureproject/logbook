Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['phonebook/templates/projects/detail']
  header_template: JST['phonebook/templates/projects/header']

  listen: ->
    @model.on('change', () => console.log @model)
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

  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'projects:index'

  initSubViews: (e) ->
    @subViews =
      team_card: new Phonebook.Views.Base.ModelView
        el: @el.querySelector('.project-team')
        template: JST['phonebook/templates/projects/team_card']
        model: @model
    super



Phonebook.Views.People ||= {}

class Phonebook.Views.People.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['phonebook/templates/people/detail']
  header_template: JST['phonebook/templates/people/header']
  listen: ->
    @events['touchend .edit'] = (e) ->
      e.preventDefault()
      Backbone.trigger 'people:edit', @model
    @events['click .trigger-edit'] = (e) ->
      e.preventDefault()
      Backbone.trigger 'people:edit', @model

  show: (animation) ->
    Backbone.trigger 'people:router:update', (@model.id || @model.cid)
    Backbone.trigger 'people:views:shown', 'detail'
    super

  hide: (animation) ->
    Backbone.trigger('people:views:hidden', @)
    super

  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'people:index'

  initSubViews: ->
    @subViews =
      notes: new Phonebook.Views.Base.ModelView
        model: @model
        el: @el.querySelector('.person-notes')
        template: JST["phonebook/templates/people/notes"]
      contact: new Phonebook.Views.Base.ModelView
        model: @model
        el: @el.querySelector('.person-contact')
        template: JST["phonebook/templates/people/contact"]
    super

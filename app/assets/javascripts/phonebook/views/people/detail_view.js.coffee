Phonebook.Views.People ||= {}

class Phonebook.Views.People.DetailView extends Phonebook.Views.Base.DetailView

  template: JST['phonebook/templates/people/detail']

  listen: ->
    @events['touchend .edit'] = (e) ->
      e.preventDefault()
      Backbone.trigger 'people:edit', @model

  show: (animation) ->
    Backbone.trigger 'people:router:update', (@model.id || @model.cid)
    Backbone.trigger 'people:views:shown', 'detail'
    super

  hide: (animation) ->
    Backbone.trigger('people:views:hidden', @)
    super

  renderSubviews: ->
    console.log @model

  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'people:index'


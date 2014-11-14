Bluebook.Views.People ||= {}

class Bluebook.Views.People.IndexView extends Backbone.View
  initialize: ->
    @collection = new Bluebook.Collections.PeopleCollection
    @collection.fetch({
      reset: true
      remote: false
    })
    #@listenTo Backbone, 'people:index', @render
    # move this event to a people master view, which will be aware of all people views
    # people presenter should listen for things like people:index, people:show etc,
    @listenTo @collection, 'reset', @render

  template: JST["bluebook/templates/people/index"]

  render: () ->
    @$el.html @template people: @collection.models
    return this


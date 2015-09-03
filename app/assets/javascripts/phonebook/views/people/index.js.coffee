class ds.PeopleIndexView extends Backbone.View
  template: JST["phonebook/templates/people/index"]
  className: "panel"
  initialize: (options = {}) ->
    @[option] = options[option] for option of options

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @collection.bootstrap()


class ds.PeopleIndexView extends Backbone.View
  template: JST["phonebook/templates/people/index"]
  className: "panel"

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->


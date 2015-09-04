class ds.PeopleIndexView extends Backbone.View
  template: JST["phonebook/templates/people/index"]
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @views =
      list: new ds.PeopleListView
        collection: @collection
      search: new ds.PeopleSearchView
        collection: @collection

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @collection.bootstrap()
    @views.list.renderTo "#people-list"
    @views.search.renderTo "#people-search"


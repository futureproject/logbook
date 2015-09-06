class ds.PeopleIndexView extends Backbone.View
  className: 'index people-index'
  template: JST["phonebook/templates/people/index"]
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @views =
      list: new ds.PeopleListView
        collection: @collection
      search: new ds.PeopleSearchView
        collection: @collection
    @listen()

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @collection.bootstrap() if @collection.length == 0
    @views.list.renderTo "#people-list"
    @views.search.renderTo "#people-search"


  listen: ->
    @listenTo Backbone, 'people:search:in', =>
      @$el.find('.titlebar').animate({height:0},'fast').addClass('hidden')
    @listenTo Backbone, 'people:search:out', =>
      @$el.find('.titlebar').animate({height: 45},'fast').removeClass('hidden')

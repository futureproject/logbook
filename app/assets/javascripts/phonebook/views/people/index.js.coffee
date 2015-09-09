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
    Backbone.trigger 'scroll:reset', 0
    @collection.bootstrap() if @collection.length < @collection.state.pageSize
    @views.list.renderTo "#people-list", { replace: true }
    @views.search.renderTo "#people-search", { replace: true }


  listen: ->
    @listenTo Backbone, 'people:search:in', =>
      @$el.find('.titlebar').animate({height:0},'fast').addClass('hidden')
    @listenTo Backbone, 'people:search:out', =>
      @$el.find('.titlebar').animate({height: 45},'fast').removeClass('hidden')

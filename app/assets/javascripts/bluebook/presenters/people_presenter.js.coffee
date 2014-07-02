class Bluebook.PeoplePresenter extends Backbone.View
  initialize: (args) ->
    @targetEl = $(args.targetEl)
    @views =
      new: new Bluebook.Views.People.NewView()
      index: new Bluebook.Views.People.IndexView(el: "#people .list-frame")
      show: new Bluebook.Views.People.ShowView(el: "#people .detail-frame")
      edit: new Bluebook.Views.People.EditView(el: "#people .detail-frame")
    @router = new Bluebook.Routers.PeopleRouter
    @listenTo @router, 'route', @show

  events: ->
    click: 'onclick'

  onclick: () ->
    return if @$el.hasClass('active')
    @show()
    Backbone.trigger 'peopleRouter:go', '/bluebook/people/', { trigger: @router.people.length < 1}

  show: ->
    @$el.addClass('active').siblings().removeClass('active')
    @targetEl.show().siblings().hide()
dream.Views.App ||= {}

class dream.Views.App.TabView extends Backbone.View
  initialize: (attrs) ->
    @presenter = attrs.presenter
    @attrs = attrs
    @listenTo Backbone, 'presenter:presenting', @setClass
    @render()

  className: 'tab'

  tagName: 'li'

  events:
    'click': 'present'

  template: JST['logbook/templates/app/tab']

  render: ->
    @$el.html(@template(tab: @attrs))
    $(@attrs.parentEl).append(@el)

  present: ->
    @presenter.present 'index',
      url: @attrs.url

  setClass: (presenter) ->
    if presenter == @presenter
      @$el.addClass('current')
    else
      @$el.removeClass('current')


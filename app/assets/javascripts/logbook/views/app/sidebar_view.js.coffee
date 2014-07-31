dream.Views.App ||= {}

class dream.Views.App.SidebarView extends Backbone.View
  initialize: ->
    @tabs = [
        { icon: 'dashboard', presenter: 'stats', label: 'Home' }
        { icon: 'checklist', presenter: 'task_assignments', label: 'Tasks' }
        { icon: 'organization', presenter: 'people', label: 'People' }
        { icon: 'rocket', presenter: 'projects', label: 'Projects' }
        { icon: 'podium', presenter: 'workshops', label: 'Workshops' }
      ]
    @render()
    @listenTo Backbone, 'presenter:presenting', @onPresent

  events:
    'click li' : 'go'

  go: (e) ->
    e.preventDefault()
    $t = $(e.currentTarget)
    path = $t.attr('data-presenter')
    Backbone.trigger 'sidebar:tapped', path

  template:
    JST['logbook/templates/app/sidebar']

  render: ->
    @$el.html(@template(tabs: @tabs))

  onPresent: (presenter) ->
    @$el.find("[data-presenter=#{presenter}]").addClass('current').siblings().removeClass('current')


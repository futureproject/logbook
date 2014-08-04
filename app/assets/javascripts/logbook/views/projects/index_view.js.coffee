dream.Views.Projects ||= {}

class dream.Views.Projects.IndexView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'projectsCollection:changed', @display

  events:
    'click .new': 'new'

  display: (collection) ->
    @collection = collection
    @render()

  template: JST['logbook/templates/projects/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('.list-body')
    frag = document.createDocumentFragment()
    @collection?.each (project) =>
      view = new dream.Views.Projects.ProjectView
        model: project
      frag.appendChild view.render().el
    @$list.html(frag)
    return this

  new: (e) ->
    e.preventDefault()
    Backbone.trigger 'project:new', @collection


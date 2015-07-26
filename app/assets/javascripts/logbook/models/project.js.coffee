class ds.Project extends Backbone.Model
  namespace: 'projects'
  urlRoot: ds.apiHelper.urlFor 'projects'
  defaults: ->
    people: []
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Project' })
    {project: attrs }

class ds.ProjectsCollection extends Backbone.PageableCollection
  model: ds.Project
  namespace: 'projects'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: (args) ->
    args ||= {}
    @mode = args.mode || 'server'
  backgrid_columns: [
    {name: 'name', cell: ds.LogbookLinkCell }
    {name: 'description', cell: 'string' }
    {name: 'people_count', cell:'integer', label: 'Team Size'}
    {name: 'status', cell:'string'}
    {name: 'created_at', cell:'date', label: 'created'}
  ]
  parseRecords: (response) ->
    response.projects
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

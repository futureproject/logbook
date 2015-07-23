class ds.Project extends Backbone.Model
  namespace: 'projects'
  urlRoot: ds.apiHelper.urlFor 'projects'
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
    {name: 'size', cell:'integer', label: 'Team Size'}
    {name: 'leading', cell:'boolean'}
  ]
  parseRecords: (response) ->
    response.projects
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

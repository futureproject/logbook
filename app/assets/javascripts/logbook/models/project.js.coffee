class ds.Project extends Backbone.Model
  namespace: 'projects'
  urlRoot: ds.apiHelper.urlFor 'projects'
  defaults: ->
    status: 'underway'
    school_id: ds.current_user.get('school_id')
    people: []
    notes: []

  toJSON: ->
    _.omit _.clone(@attributes), ['people', 'notes']

  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Project' })
    {project: attrs }

  save: ->
    @set('leader_ids', ['']) if !@get('leader_ids')?
    @set('supporter_ids', ['']) if !@get('supporter_ids')?
    super

  validate: (attrs, options) ->
    if !attrs.name
      "This project needs a name."
    else if !attrs.school_id
      "This project needs a school."

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
    {name: 'status', cell:'string'}
    {name: 'people_count', cell:'integer', label: 'Team Size'}
    {name: 'created_at', cell:'date', label: 'created'}
  ]
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

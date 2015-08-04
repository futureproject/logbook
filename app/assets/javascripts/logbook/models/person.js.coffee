class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  initialize: ->
    @collections =
      projects: new ds.ProjectsCollection { mode: 'client' }
      engagements: new ds.EngagementsCollection { mode: 'client' }
      notes: new ds.NotesCollection
  defaults: ->
    role: 'student'
    grade: 9
    school_id: ds.current_user.get('school_id')
    projects: []
    engagements: []
    notes: []
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Person' })
    {person: attrs }

class ds.PeopleCollection extends Backbone.PageableCollection
  model: ds.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: (args) ->
    args ||= {}
    @mode = args.mode || 'server'
  backgrid_columns: [
    {name: 'first_name', label: 'First', cell: ds.LogbookLinkCell }
    {name: 'last_name', cell: ds.LogbookLinkCell, label: 'Last'}
    {name: 'role', cell:'string'}
    {name: 'dream_team', cell:'boolean', label: 'DT'}
    {name: 'grade', cell:'integer'}
    {name: 'projects_count', cell:'integer', label: 'Projects'}
    {name: 'engagements_count', cell:'integer', label: 'Engagements'}
    {name: 'created_at', cell:'date', label: 'Date Added'}
    #{name: 'links', cell: ds.ActionCell}
  ]
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

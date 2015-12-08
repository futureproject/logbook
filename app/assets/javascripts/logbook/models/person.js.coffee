class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults: ->
    role: 'student'
    grade: 9
    school_id: ds.current_user.get('school_id')
    projects: []
    engagements: []
    notes: []

  toJSON: ->
    _.omit _.clone(@attributes), ['engagements', 'projects', 'notes']

  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Person' })
    {person: attrs }

  validate: (attrs, options) ->
    if !attrs.first_name
      "This person needs a first name."
    else if !attrs.last_name
      "This person needs a last name."

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
    #{name: 'role', cell:'string'}
    #{name: 'dream_team', cell:'boolean', label: 'DT'}
    {name: 'grade', cell:'integer'}
    {name: 'project_people_count', cell:'integer', label: 'Projects'}
    {name: 'engagement_attendees_count', cell:'integer', label: 'Engagements'}
    {name: 'notes_count', cell:'integer', label: 'Notes'}
    {name: 'last_engaged', cell:'date', label: 'Last Engaged'}
    #{name: 'links', cell: ds.ActionCell}
  ]
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

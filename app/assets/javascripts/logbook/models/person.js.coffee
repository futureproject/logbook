class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults:
    projects: []
    engagements: []
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
    {name: 'dream_team', cell:'boolean', label: 'Dream Team'}
    {name: 'grade', cell:'integer'}
    {name: 'projects_count', cell:'integer', label: 'Projects'}
    {name: 'engagements_count', cell:'integer', label: 'Engagements'}
    #{name: 'links', cell: ds.ActionCell}
  ]
  parseRecords: (response) ->
    response.people
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

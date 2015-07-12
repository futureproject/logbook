class ds.School extends Backbone.Model
  namespace: 'schools'
  urlRoot: ds.apiHelper.urlFor 'school'
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'School' })
    attrs

class ds.SchoolsCollection extends Backbone.Collection
  model: ds.School
  namespace: 'schools'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: ->
    @listenTo Backbone, 'scope:set', => @fetch({ reset: true })
  backgrid_columns: [
    {name: 'name', cell:'string', label: 'School Name'}
    {name: 'enrollment', cell:'integer'}
    {name: 'engaged_people_count', cell:'integer', label: "Engaged Ppl"}
    {name: 'engagements_count', cell:'integer', label: "Engagements"}
    {name: 'person_hours', cell:'integer', label: "Person Hrs"}
    {name: 'projects_count', cell:'integer', label: "Projects"}
    {name: 'people_with_projects_count', cell:'integer', label: "Ppl w/Projects"}
  ]

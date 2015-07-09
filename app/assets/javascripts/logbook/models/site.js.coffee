class ds.Site extends Backbone.Model
  urlRoot: ds.apiHelper.urlFor 'site'
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Site' })
    attrs

class ds.SitesCollection extends Backbone.Collection
  model: ds.Site
  namespace: 'sites'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: ->
    Backbone.trigger 'collection:init', @
  backgrid_columns: [
    {name: 'name', cell:'string', label: 'Place'}
    {name: 'enrollment', cell:'integer'}
    {name: 'engaged_people_count', cell:'integer', label: "Engaged Ppl"}
    {name: 'person_hours', cell:'integer', label: "Person Hrs"}
    {name: 'projects_count', cell:'integer', label: "Projects"}
    {name: 'people_with_projects_count', cell:'integer', label: "Ppl w/Projects"}
  ]

class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'person'
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Person' })
    attrs

class ds.PeopleCollection extends Backbone.PageableCollection
  model: ds.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
  #initialize: ->
    #@listenTo Backbone, 'scope:set', => @fetch({ reset: true })
  backgrid_columns: [
    {name: 'first_name', cell:'string'}
    {name: 'last_name', cell:'string'}
    {name: 'dream_team', cell:'boolean'}
    {name: 'grade', cell:'integer'}
    {name: 'school_id', cell:'integer'}
  ]
  mode: 'infinite'

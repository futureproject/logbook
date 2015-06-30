class ds.School extends Backbone.Model
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'School' })
    attrs

class ds.SchoolsCollection extends Backbone.Collection
  model: ds.School

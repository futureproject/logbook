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
    @fetch
      remote: false
      reset: true
      success: =>
        @fetch
          remote: true
          reset: true

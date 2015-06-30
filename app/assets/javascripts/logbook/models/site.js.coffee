class ds.Site extends Backbone.Model
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Site' })
    attrs

class ds.SitesCollection extends Backbone.Collection
  model: ds.Site

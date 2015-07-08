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

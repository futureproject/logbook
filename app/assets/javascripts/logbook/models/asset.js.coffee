class ds.Asset extends Backbone.Model
  namespace: 'assets'
  urlRoot: ds.apiHelper.urlFor 'assets'

  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Asset' })
    {asset: attrs }


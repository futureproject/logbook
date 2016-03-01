class ds.Asset extends Backbone.Model
  namespace: 'assets'
  urlRoot: ds.apiHelper.urlFor 'assets'
  defaults:
    meta: {}

  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Asset' })
    {asset: attrs }

class ds.AssetsCollection extends Backbone.PageableCollection
  model: ds.Asset
  namespace: 'assets'
  url: -> ds.apiHelper.urlFor @namespace
  intialize: (args={}) ->
    @mode = args.mode || 'server'
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

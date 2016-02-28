class ds.Note extends Backbone.Model
  namespace: 'notes'
  urlRoot: ds.apiHelper.urlFor 'notes'
  defaults: ->
    notable_id: null
    notable_type: null
    author: ds.current_user.get('first_name')
    assets: []

  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Note' })
    {note: attrs }

  initialize: ->
    #enforce a Title Case, singular notable_type
    @set 'notable_type', ds.nounsHelper.constantize(@get('notable_type'))

  getNotable: ->
    n_type = @get "notable_type"
    n_id = @get "notable_id"
    model = new ds[n_type]({ id: n_id })
    ds.collections[model.namespace].get(n_id) || model

  toJSON: ->
    attrs = _.clone @attributes
    newAttrs = _.extend(attrs, { assets_attributes: @get('assets'), poster: _.first(@get('assets')) })
    newAttrs

  getKind: ->
    assets = @get('assets')
    if assets.length == 1 && assets[0].original.match(/jpg|png|gif|svg/i)
      "media"
    else
      "text"

class ds.NotesCollection extends Backbone.PageableCollection
  model: ds.Note
  namespace: 'notes'
  url: -> ds.apiHelper.urlFor @namespace
  comparator: (model) ->
    - Date.parse(model.get('created_at'))
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

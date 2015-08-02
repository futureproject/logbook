class ds.Note extends Backbone.Model
  namespace: 'notes'
  urlRoot: ds.apiHelper.urlFor 'notes'
  defaults: ->
    user_id: ds.current_user.get('school_id')
    notable_id: null
    notable_type: null
    author: ds.current_user.get('first_name')

  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Note' })
    {note: attrs }

  initialize: ->
    #enforce a Title Case, singular notable_type
    @set 'notable_type', ds.nounsHelper.singularize(@get('notable_type')).toTitleCase()

class ds.NotesCollection extends Backbone.Collection
  model: ds.Note
  namespace: 'notes'
  url: -> ds.apiHelper.urlFor @namespace

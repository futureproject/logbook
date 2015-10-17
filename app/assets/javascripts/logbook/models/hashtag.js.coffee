class ds.Hashtag extends Backbone.Model
  namespace: 'hashtags'
  urlRoot: ds.apiHelper.urlFor 'hashtags'
  idAttribute: 'name'
  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Hashtag' })
    {hashtag: attrs }

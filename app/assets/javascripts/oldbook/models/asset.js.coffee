class Phonebook.Models.Asset extends Backbone.Model
  urlRoot: ds.apiHelper.urlFor 'assets'

  thumb: ->
    external_url = @get('external_url')
    # if it's an image
    if !!@get('external_url').match(/jpg|gif|png/i)
      t = @get('thumbnail')
    # return the processed thumbnail, or the raw upload
      if t then t else external_url
    else # it's not an image
       "//dream-os-production.s3.amazonaws.com/static-assets/document.png"

  tplAttrs: ->
    attrs = _.clone @attributes
    attrs.preview = @thumb()
    attrs

class Phonebook.Collections.AssetsCollection extends Backbone.Collection
  model: Phonebook.Models.Asset
  url: -> ds.apiHelper.urlFor 'asset'

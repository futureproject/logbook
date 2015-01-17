class Phonebook.Models.Asset extends Backbone.Model
  urlRoot: ds.apiHelper.urlFor 'assets'

  defaults: ->
    caption: ""
    thumbnail: "//dream-os-production.s3.amazonaws.com/static-assets/document.png"

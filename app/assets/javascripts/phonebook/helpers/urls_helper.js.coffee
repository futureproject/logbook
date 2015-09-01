window.ds ||= {}

ds.urlsHelper =
  urlFor: (model) ->
    id = model.cid
    "/phonebook/#{model.namespace}/#{id}"

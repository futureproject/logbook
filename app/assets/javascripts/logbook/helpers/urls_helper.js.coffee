window.ds ||= {}

ds.urlsHelper =
  urlFor: (model) ->
    id = model.id || model.cid
    "/logbook/#{model.namespace}/#{id}"
  scopeParams: ->
    "scope_type=#{ds.CONSTANTS.scope.type}&scope_id=#{ds.CONSTANTS.scope.id}"

window.ds ||= {}

ds.urlsHelper =
  urlFor: (model) ->
    "/logbook/#{model.namespace}/#{model.get('id')}"

  scopeParams: ->
    "scope_type=#{ds.CONSTANTS.scope.type}&scope_id=#{ds.CONSTANTS.scope.id}"

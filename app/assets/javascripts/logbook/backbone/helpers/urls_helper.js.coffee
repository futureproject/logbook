window.ds ||= {}

ds.urlsHelper =
  scopeParams: ->
    "scope_type=#{ds.CONSTANTS.scope.type}&scope_id=#{ds.CONSTANTS.scope.id}"

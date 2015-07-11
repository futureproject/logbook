ds.StatsRowView = Backgrid.Row.extend
  className: ->
    scope = ds.scopeHelper.getScope()
    if (@model.id == scope.id && @model.namespace == scope.namespace)
      "stats-row stats-row-current"
    else
      "stats-row"

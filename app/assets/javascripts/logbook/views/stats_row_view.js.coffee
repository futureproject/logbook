class ds.StatsRowView extends Backgrid.Row
  className: ->
    scope = ds.scopeHelper.getScope()
    if (@model.id == scope.id && @model.namespace == scope.namespace)
      "stats-row stats-row-current"
    else
      "stats-row"

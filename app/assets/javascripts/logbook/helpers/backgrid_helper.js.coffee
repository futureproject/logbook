if Backgrid?
  Backgrid.Column.prototype.defaults.editable = false
  Backgrid.Column.prototype.defaults.sortType = "toggle"
  Backgrid.HeaderCell.prototype.onClick = (e) ->
    cycleSort = (header, col) ->
      if column.get('direction') == 'ascending'
        collection.trigger event, col, 'descending'
      else if column.get('direction') == 'descending'
        collection.trigger event, col, null
      else
        collection.trigger event, col, 'ascending'
      return

    toggleSort = (header, col) ->
      if column.get('direction') == 'descending'
        collection.trigger event, col, 'ascending'
      else
        collection.trigger event, col, 'descending'
      return

    e.preventDefault()
    column = @column
    collection = @collection
    event = 'backgrid:sort'
    sortable = Backgrid.callByNeed(column.sortable(), column, @collection)
    if sortable
      sortType = column.get('sortType')
      if sortType == 'toggle'
        toggleSort this, column
      else
        cycleSort this, column
    return


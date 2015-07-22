class ds.PermalinkFormatter extends Backgrid.CellFormatter
  fromRaw: (rawValue, model) ->
    "<a href='#{ds.urlsHelper.urlFor(model)}'>#{rawValue}</a>"

class ds.PermalinkCell extends Backgrid.StringCell
  formatter: ds.PermalinkFormatter
  events:
    'click': 'onclick'
  onclick: (e) ->
  render: ->
    this.$el.empty()
    model = this.model
    this.$el.html(this.formatter.fromRaw(model.get(this.column.get("name")), model))
    this.delegateEvents()
    return this

class ds.ActionCell extends Backgrid.Cell
  className: -> 'action-cell'
  template: (model) -> "
    <a class='btn' href='#{ds.urlsHelper.urlFor(model)}'>View</a>
    <a class='btn' href='#{ds.urlsHelper.urlFor(model)}/edit'>Edit</a>
  "
  render: ->
    @$el.html(@template(@model))
    @delegateEvents()
    return this

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


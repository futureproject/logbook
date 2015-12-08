class ds.LogbookLinkFormatter extends Backgrid.CellFormatter
  fromRaw: (rawValue, model) ->
    desc = model.get("description")
    url = model.get('url') || ds.urlsHelper.urlFor(model)
    if desc
      "<a title='#{desc}' href='#{url}'>#{rawValue}</a>"
    else
      "<a href='#{ds.urlsHelper.urlFor(model)}'>#{rawValue}</a>"

class ds.LogbookLinkCell extends Backgrid.StringCell
  formatter: ds.LogbookLinkFormatter
  render: ->
    this.$el.empty()
    model = this.model
    this.$el.html(this.formatter.fromRaw(model.get(this.column.get("name")), model))
    this.delegateEvents()
    return this

class ds.AbbreviatedHeaderCell extends Backgrid.HeaderCell
  render: ->
    @$el.addClass("abbreviated")
    @$el.html "<a title='#{@column.attributes.title}'>#{@column.attributes.label}</a>"
    @

class ds.ViewCell extends Backgrid.Cell
  className: -> 'action-cell'
  template: (model) -> "<a href='#{ds.urlsHelper.urlFor(model)}'>View</a>"
  render: ->
    @$el.html(@template(@model))
    @delegateEvents()
    return this

class ds.EditCell extends Backgrid.Cell
  className: -> 'action-cell'
  template: (model) ->
    "<a href='#{ds.urlsHelper.urlFor(model)}/edit'>Edit</a>"
  render: ->
    @$el.html(@template(@model))
    @delegateEvents()
    return this

class ds.ActionCell extends Backgrid.Cell
  className: -> 'action-cell'
  template: (model) ->
    "<a href='#{ds.urlsHelper.urlFor(model)}'>View</a>
    <a href='#{ds.urlsHelper.urlFor(model)}/edit'>Edit</a>"
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


class ds.BackgridPaginator extends Backgrid.Extension.Paginator
  render: ->
    super
    @$el.find('ul').append "<li class='count'>#{@collection.state.totalRecords} records</li>"

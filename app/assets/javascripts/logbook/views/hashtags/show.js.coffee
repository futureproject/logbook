class ds.HashtagsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views =
      table: new Backgrid.Grid
        collection: new Backbone.Collection
        columns: [
          {name: 'class_name', cell:'string', label: 'Record Type'}
          {name: 'name', cell: ds.LogbookLinkCell }
          {name: 'description', cell: 'string' }
        ]

  template: JST['logbook/templates/hashtags_show']
  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @
  postRender: ->
    @views.table.renderTo "#records-table"
    @views.table.collection.reset @model.get('records')
  className: 'hashtags show'

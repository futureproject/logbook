class ds.IndexTableView extends Backgrid.Grid
  initialize: ->
    super
    @listenTo @collection, 'backgrid:sort', (model) ->
      cid = model.cid
      filtered = model.collection.filter((model) ->
        model.cid != cid
      )
      _.each filtered, (model) ->
        model.set 'direction', null
        return
      return

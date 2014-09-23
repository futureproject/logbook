class dream.ReportsPresenter extends Backbone.View

  initialize: (args) ->
    @initCollection()

  initCollection: ->
    @collection = new dream.Collections.Reports

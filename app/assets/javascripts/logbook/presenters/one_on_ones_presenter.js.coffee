class dream.OneOnOnesPresenter extends Backbone.View

  initialize: (args) ->
    @initCollection()

  initCollection: ->
    @collection = new dream.Collections.OneOnOnes

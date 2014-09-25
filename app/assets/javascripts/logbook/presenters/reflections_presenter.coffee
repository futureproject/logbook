class dream.ReflectionsPresenter extends Backbone.View

  initialize: (args) ->
    @initCollection()

  initCollection: ->
    @collection = new dream.Collections.Reflections

class dream.Models.Reflection extends Backbone.Model
  urlRoot: '/reflections'

class dream.Collections.Reflections extends Backbone.Collection
  initialize: ->
    @fetch { remote: false }
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'reflections:add', @addOne

  url: '/reflections'

  model: dream.Models.Reflection

  addOne: (data) ->
    model = new dream.Models.Reflection(data)
    @add(model)
    model.save()

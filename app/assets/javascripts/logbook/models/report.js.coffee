class dream.Models.Report extends Backbone.Model
  urlRoot: '/reports'

class dream.Collections.Reports extends Backbone.Collection
  initialize: ->
    @fetch { remote: false }
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'reports:add', @addOne

  url: '/reports'

  model: dream.Models.Report

  addOne: (data) ->
    model = new dream.Models.Report(data)
    @add(model)
    model.save()
    console.log @

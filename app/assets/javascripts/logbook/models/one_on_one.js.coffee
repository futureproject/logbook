class dream.Models.OneOnOne extends Backbone.Model
  urlRoot: '/one_on_ones'
  defaults: ->
    duration: '.25'
    school_id: dream.USER.school.id
    date: new Date().toString('yyyy-MM-dd')
    note: ''

class dream.Collections.OneOnOnes extends Backbone.Collection
  initialize: ->
    #@bootstrap()
    @fetch { remote: false }
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'one_on_ones:add', @addOne
    @listenTo Backbone, 'one_on_ones:findByPersonId', @findByPersonId

  url: '/one_on_ones'

  model: dream.Models.OneOnOne

  comparator: (model) ->
    - Date.parse(model.get('date'))

  addOne: (model) ->
    @add(model)
    model.save()

  findByPersonId: (person_id, callback) ->
    subset = @where({person_id: person_id})
    callback.call(@, subset) if callback?
    subset

  bootstrap: ->
    @fetch
      remote: false
      reset: true
      success: =>
        @fetch
          remote: true
          success: =>
            @


class dream.Models.Testimonial extends Backbone.Model
  urlRoot: '/testimonials'

class dream.Collections.Testimonials extends Backbone.Collection
  initialize: ->
    @fetch { remote: false }
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'reports:add', @addOne

  url: '/testimonials'

  model: dream.Models.Testimonial

  addOne: (data) ->
    model = new dream.Models.Testimonial(data)
    @add(model)
    model.save()
    console.log @

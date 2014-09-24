class dream.TestimonialsPresenter extends Backbone.View

  initialize: (args) ->
    @initCollection()

  initCollection: ->
    @collection = new dream.Collections.Testimonials

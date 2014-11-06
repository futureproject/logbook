ds.Views ||= {}

class ds.Views.Filters extends Backbone.View
  events: ->
    'click > ul > li': (e) ->
      $(e.currentTarget).toggleClass('is-active').siblings().removeClass('is-active')

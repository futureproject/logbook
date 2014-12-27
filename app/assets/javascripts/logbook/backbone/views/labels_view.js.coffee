window.ds ||= {}

class ds.LabelsView extends Backbone.View
  initialize: ->
    return if Modernizr?.csspositionsticky || !@el?
    @setTriggerPosition()
    @listenTo Backbone, 'filters:toggled', @setTriggerPosition
    @activate()

  setTriggerPosition: ->
    @triggerPosition = @el.getBoundingClientRect().top
    console.log @triggerPosition

  activate: ->
    $(window).on('scroll', (event) =>
      scrollPos = window.pageYOffset
      if scrollPos >= @triggerPosition
        @$el.addClass('locked').next().css('margin-top', @el.getBoundingClientRect().height + 'px')
      else
        @$el.removeClass('locked').next().css('margin-top','')
    )
$ ->
  ds.labels_view = new ds.LabelsView({ el: '.labels' })



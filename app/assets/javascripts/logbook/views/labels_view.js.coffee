window.ds ||= {}

class ds.LabelsView extends Backbone.View
  initialize: ->
    return if Modernizr?.csspositionsticky || !@el?
    @setTriggerPosition()
    @listenTo Backbone, 'filters:toggled', @setTriggerPosition
    @activate()

  setTriggerPosition: ->
    @triggerPosition = @$el.offset().top

  activate: ->
    $(window).on('scroll', (event) =>
      scrollPos = window.pageYOffset
      if scrollPos >= @triggerPosition
        @$el.addClass('locked').next().css('margin-top', @el.getBoundingClientRect().height + 'px')
      else
        @$el.removeClass('locked').next().css('margin-top','')
    )
  events:
    'click a': (event) ->
      @$el.find('a').removeClass('active')
      $(event.currentTarget).addClass('active')

$ ->
  ds.labels_view = new ds.LabelsView({ el: '.labels' })



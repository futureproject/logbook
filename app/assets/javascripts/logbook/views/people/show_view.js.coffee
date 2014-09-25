dream.Views.People ||= {}

class dream.Views.People.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:show', @display
    @listenTo Backbone, 'person:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/people/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'person:edit', @model

    'blur #person_notes': 'saveNotes'

    'click .show-new-report': ->
      @$el.find('#new_report').show()
      @$el.find('nav').hide()
    'click .show-new-testimonial': ->
      @$el.find('#new_testimonial').show()
      @$el.find('nav').hide()
    'click .show-new-reflection': ->
      @$el.find('#new_reflection').show()
      @$el.find('nav').hide()
    'click .cancel': (e) ->
      e.preventDefault()
      $t = $(e.currentTarget)
      $t.closest('form').hide()
      @$el.find('nav').show()

    'submit #new_reflection': 'logReflection'
    'submit #new_report' : 'logReport'
    'submit #new_testimonial' : 'logTestimonial'
    'submit form': (e) ->
      e.currentTarget?.reset()
      $nav = @$el.find('nav')
      @$el.find('.person-actions form').hide()
      $('.person-actions').find('.success').show().delay(2000).fadeOut( ->
        $nav.show()
      )

    'click .project': (e) ->
      id = e.currentTarget.getAttribute('data-id')
      Backbone.trigger 'projects:link', "/logbook/projects/#{id}"

    'click .accordion-heading': (e) ->
      $(e.currentTarget).closest('.accordion-bar').toggleClass('is-active').siblings().removeClass('is-active')

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'router:update', "logbook/people/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    @loadNetworkData()
    #@updateCounts()
    #@showLogs()
    return @

  loadNetworkData: ->
    return unless navigator.onLine
    $('#person-stats').load "/people/#{@model.get('id')}/stats"

  hide: ->
    @$el.hide()

  saveNotes: (e) ->
    @model.save
      notes: $(e.currentTarget).val()

  logReflection: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize e.currentTarget
    data.person_id = @model.get('id')
    Backbone.trigger 'reflections:add', data

  logReport: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize e.currentTarget
    data.person_id = @model.get('id')
    Backbone.trigger 'reports:add', data

  logTestimonial: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize e.currentTarget
    data.person_id = @model.get('id')
    Backbone.trigger 'testimonials:add', data


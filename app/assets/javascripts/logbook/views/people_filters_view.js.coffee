class ds.PeopleFiltersView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection

  events:
    'click .trigger': 'toggle'
    'submit': 'applyFilters'
    'reset': 'resetFilters'

  className: "table-filters people-filters"
  template: JST["logbook/templates/people_filters"]

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @$form = @$el.find('form')
    @restoreOldFilters()
    @setDateFallback()

  restoreOldFilters: ->
    # deserialize the filters based on collection queryParams
    # then, if there are any filters applied, show thyself
    attrs = Backbone.Syphon.serialize @
    data = {}
    data[k] = @collection.queryParams[k] for k,v of attrs
    Backbone.Syphon.deserialize @, data
    i = 0
    for k,v of data
      i += 1 if v?
    if i > 0
      @open()
      Backbone.trigger 'filters:apply', @collection.namespace, data

  applyFilters: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    Backbone.trigger 'filters:apply', @collection.namespace, data

  setDateFallback: ->
    @$el.find('.date-field input').each (index) ->
      picker = new Pikaday
        field: this
        firstDay: 1,
        yearRange: 5
        defaultDate: if(index) == 0 then new Date(ds.CONSTANTS.beginning_of_school_year) else new Date()

  resetFilters: ->
    data = Backbone.Syphon.serialize @
    data[filter] = null for filter, val of data
    Backbone.trigger 'filters:apply', @collection.namespace, data

  toggle: (event) ->
    event?.preventDefault()
    if @$el.hasClass('open') then @close() else @open()

  open: ->
    @$form.slideDown(300)
    @$el.find('.trigger-label').text("Reset Filters")
    @$el.addClass('open')

  close: ->
    @$form.slideUp 300, =>
      @$el.find('.trigger-label').text("Add Filters")
      @$el.removeClass('open')
      @$form.get(0).reset()

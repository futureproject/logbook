class ds.PeopleFiltersView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection

  events:
    'click .trigger': 'toggle'
    'change': (event) -> console.log event
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
    # deserialize the filters based on collection queryParams
    # then, if there are any filters applied, show thyself
    attrs = Backbone.Syphon.serialize @
    data = {}
    data[k] = @collection.queryParams[k] for k,v of attrs
    Backbone.Syphon.deserialize @, data
    i = 0
    for k,v of data
      i += 1 if v?
    @open() if i > 0

  applyFilters: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @collection.queryParams[filter] = val for filter, val of data
    @collection.fetch({reset: true})

  resetFilters: ->
    data = Backbone.Syphon.serialize @
    @collection.queryParams[filter] = null for filter, val of data
    @collection.fetch({reset: true})

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

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
    # deserialize the filters based on collection queryParams
    # then, if there are any filters applied, show thyself
    @

  applyFilters: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @collection.queryParams[filter] = val for filter, val of data
    @collection.fetch({reset: true})

  resetFilters: ->
    data = Backbone.Syphon.serialize @
    @collection.queryParams[filter] = null for filter, val of data
    @collection.fetch({reset: true})

  hide: ->
    @resetFilters()
    super

  toggle: (event) ->
    event?.preventDefault()
    if @$el.hasClass('open') then @close() else @open()

  open: ->
    @$el.find('form').slideDown(300)
    @$el.find('.trigger-label').text("Reset Filters")
    @$el.addClass('open')

  close: ->
    @$el.find('form').slideUp 300, =>
      @$el.find('.trigger-label').text("Add Filters")
      @$el.removeClass('open')

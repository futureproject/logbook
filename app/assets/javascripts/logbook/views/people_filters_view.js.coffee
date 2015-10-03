class ds.PeopleFiltersView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection

  events:
    'submit': 'applyFilters'
    'reset': 'resetFilters'

  tagName: "form"
  className: "people-filters"
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

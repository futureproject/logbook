class ds.TableFiltersView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection

  events:
    'submit': 'applyFilters'

  tagName: "form"
  template: _.template '
    <label>Filter String:</label>
    <input name="filter" type="text" class="unstyled filters" placeholder="dream_team and grade>10"/>
    <button type="submit" value="submit">Apply Filters</button>
  '

  render: ->
    @$el.html @template()
    @

  applyFilters: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @collection.fetch
      data: data

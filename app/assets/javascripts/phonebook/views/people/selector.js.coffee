class ds.PersonSelectorView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    # set the standard peoplecollection if there isn't one supplied
    @collection ||= ds.collections?.people
    @collection.bootstrap()
    @field_name ||= "person_ids"
    @field_label ||= "People"
    @listen()

  className: 'field person-selector-field'

  template: JST["phonebook/templates/people/selector"]

  listen: ->
    @listenTo @collection, 'reset', @render

  events:
    'change select': 'setLabel'

  setLabel: (event) ->
    c = event.currentTarget.selectedOptions.length
    @$el.find('.count').text("#{c} ")

  render: ->
    @$el.html @template({
      field_name: @field_name
      field_label: @field_label
      options: _.map @collection.sortBy('first_name'), (m) -> m.attributes
    })
    @postRender()
    @

  postRender: ->


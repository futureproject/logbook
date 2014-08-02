class dream.Views.People.PersonView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:selected change:first_name change:last_name', @render

  template: JST['logbook/templates/people/person']

  className: 'list-item'

  events:
    'click': 'select'

  select: -> @model.collection.select(@model)

  render: ->
    @$el.html(@template(@model.toJSON()))
    if @model.has('selected')
      @el.classList.add('is_active')
    else
      @el.classList.remove('is_active')
    return @

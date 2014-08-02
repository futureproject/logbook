dream.Views.People ||= {}

class dream.Views.People.IndexView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'peopleCollection:changed', @display

  display: (collection) ->
    @collection = collection
    @render()

  template: JST['logbook/templates/people/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('.list-body')
    frag = document.createDocumentFragment()
    @collection?.each (person) =>
      view = new dream.Views.People.PersonView
        model: person
      frag.appendChild view.render().el
    @$list.html(frag)

class dream.Views.People.PersonView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:selected', @render

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

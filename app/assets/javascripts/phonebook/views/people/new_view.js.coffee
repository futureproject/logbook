Phonebook.Views.People ||= {}

class Phonebook.Views.People.NewView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @model = new Phonebook.Models.Person
    @listen()

  template: JST['phonebook/templates/people/new']

  className: 'detail detail-new'

  events:
    'touchend .back': 'cancel'
    'touchend .done': 'submitForm'
    'touchmove .titlebar' : (e) -> e.preventDefault()

  cancel: (e) ->
    e.preventDefault()
    @model.destroy()
    @hide()
    Backbone.trigger 'people:index'

  listen: ->
    @listenTo Backbone, 'people:saved', => @hide()

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
    Backbone.trigger 'people:router:update', 'new'
    Backbone.trigger 'people:views:shown', 'modal'

  hide: (animation) ->
    animation ||= 'slide-out-vertical'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @model?.unset('selected')
      @remove()
    )
    Backbone.trigger('people:views:hidden', @)

  submitForm: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @$el.find('form').trigger 'submit'
    @hide()
    Backbone.trigger 'people:show', @model, 'fade-in'

  render: ->
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.People.FormView(
      el: '#new-person-form'
      model: @model
    ).render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()

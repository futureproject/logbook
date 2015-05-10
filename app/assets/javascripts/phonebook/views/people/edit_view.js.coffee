Phonebook.Views.People ||= {}

class Phonebook.Views.People.EditView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/people/edit']

  className: 'detail detail-edit'

  events:
    'touchend .back': 'cancel'
    'touchend .done': 'submitForm'
    'touchmove .titlebar' : (e) -> e.preventDefault()
    'click .delete' : 'destroy'

  cancel: (e) ->
    e.preventDefault()
    @hide()

  listen: ->
    @listenTo Backbone, 'people:saved', => @hide()

  show: (animation) ->
    animation ||= 'fade-in'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
    Backbone.trigger 'people:router:update', @model.get('id') + "/edit"
    Backbone.trigger 'people:views:shown', 'detail'

  hide: (animation) ->
    animation ||= 'fade-out'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )
    Backbone.trigger('people:views:hidden', @)
    Backbone.trigger 'people:router:update', @model.get('id')

  submitForm: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @$el.find('form').trigger 'submit'

  render: ->
    console.log 'rendering edit'
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.People.FormView(
      el: '#edit-person-form'
      model: @model
    ).render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()

  destroy: ->
    if (confirm("Are you sure you want to delete this person?"))
      @model.destroy()
      Backbone.trigger 'people:index'
    else
      return


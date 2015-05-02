Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.EditView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/projects/edit']

  className: 'detail detail-edit'

  events:
    'touchend .back': 'cancel'
    'touchend .done': 'submitForm'
    'touchmove .titlebar' : (e) -> e.preventDefault()

  cancel: (e) ->
    e.preventDefault()
    @hide()

  listen: ->
    #@listenTo @model, 'change', @render

  show: (animation) ->
    animation ||= 'fade-in'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
    Backbone.trigger 'projects:router:update', @model.get('id') + "/edit"
    Backbone.trigger 'projects:views:shown', 'detail'

  hide: (animation) ->
    animation ||= 'fade-out'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )
    Backbone.trigger('projects:views:hidden', @)
    Backbone.trigger 'projects:router:update', @model.get('id')

  submitForm: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @$el.find('form').trigger 'submit'
    @hide()

  render: ->
    console.log 'rendering edit'
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.Projects.FormView(
      el: '#edit-project-form'
      model: @model
    ).render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()

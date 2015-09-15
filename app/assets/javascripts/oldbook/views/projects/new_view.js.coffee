Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.NewView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @model = new Phonebook.Models.Project
    @listen()

  template: JST['oldbook/templates/projects/new']

  className: 'detail detail-new'

  events:
    'touchend .back': 'cancel'
    'touchend .done': 'submitForm'
    'touchmove .titlebar' : (e) -> e.preventDefault()

  cancel: (e) ->
    e.preventDefault()
    @model.destroy()
    @hide()
    Backbone.trigger 'projects:index'

  listen: ->
    @listenTo Backbone, 'projects:saved', => @hide()

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
    Backbone.trigger 'projects:router:update', 'new'
    Backbone.trigger 'projects:views:shown', 'modal'

  hide: (animation) ->
    animation ||= 'slide-out-vertical'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @model?.unset('selected')
      @remove()
    )
    Backbone.trigger('projects:views:hidden', @)

  submitForm: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @$el.find('form').trigger 'submit'
    @hide()
    Backbone.trigger 'projects:show', @model, 'fade-in'

  render: ->
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.Projects.FormView(
      el: '#new-project-form'
      model: @model
    ).render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()

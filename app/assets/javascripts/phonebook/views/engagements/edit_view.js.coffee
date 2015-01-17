Phonebook.Views.Engagements ||= {}
class Phonebook.Views.Engagements.EditView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/engagements/edit']

  className: 'detail detail-edit'

  events:
    'tap .back': 'cancel'
    'tap .done': 'submitForm'
    'touchmove .detail-title' : (e) -> e.preventDefault()

  cancel: ->
    @hide()
    #Backbone.trigger 'engagements:show', @model, 'fade-in-fast'

  listen: ->
    @listenTo @model, 'change', @render

  show: (animation) ->
    animation ||= 'fade-in'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
    Backbone.trigger 'engagements:router:update', @model.get('id') + "/edit"
    Backbone.trigger 'engagements:views:shown', 'detail'

  hide: (animation) ->
    animation ||= 'fade-out'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )
    Backbone.trigger('engagements:views:hidden', @)
    Backbone.trigger 'engagements:router:update', @model.get('id')

  submitForm: (e) ->
    e.stopPropagation()
    @$el.find('form').trigger 'submit'
    @hide()

  render: ->
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.Engagements.FormView(
      el: '#edit-engagement-form'
      model: @model
    ).render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()

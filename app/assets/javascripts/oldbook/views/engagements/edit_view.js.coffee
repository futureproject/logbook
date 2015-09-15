Phonebook.Views.Engagements ||= {}
class Phonebook.Views.Engagements.EditView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['oldbook/templates/engagements/edit']

  className: 'detail detail-edit'

  events:
    'touchend .back': 'cancel'
    'touchend .done': 'submitForm'
    'touchmove .titlebar' : (e) -> e.preventDefault()
    'click .delete' : 'destroy'

  cancel: (e) ->
    e.preventDefault()
    @hide()
    #Backbone.trigger 'engagements:show', @model, 'fade-in-fast'

  listen: ->
    @listenTo Backbone, 'engagements:saved', => @hide()

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
    e.preventDefault()
    e.stopPropagation()
    @$el.find('form').trigger 'submit'

  render: ->
    console.log 'rendering edit'
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

  destroy: ->
    if (confirm("Are you sure you want to delete this engagement?"))
      @model.destroy()
      Backbone.trigger 'engagements:index'
    else
      return

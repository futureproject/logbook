Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/engagements/show']

  className: 'detail detail-show'

  events:
    'tap .back': 'back'
    'swiperight': 'back'
    'tap .edit': -> Backbone.trigger 'engagements:edit', @model
    'tap .upload': 'showUploads'
    'tap .attendance': 'showAttendance'
    'touchmove .detail-title': (e) -> e.preventDefault()
    #'blur .editable': 'saveContent'

  listen: ->
    @listenTo @model, 'change', @render

  show: (animation) ->
    animation ||= 'slide-in-horizontal'
    @$container.append @$el.addClass(animation)
    @render()
    @model.set 'selected', true
    @$el.one 'webkitAnimationEnd', =>
      @model.fetch()
    Backbone.trigger 'engagements:router:update', @model.get('id')
    Backbone.trigger 'engagements:views:shown', 'detail'

  hide: ->
    @$el.addClass('hiding').one('webkitAnimationEnd', () =>
      @model?.unset('selected')
      @remove()
    )
    Backbone.trigger('engagements:views:hidden', @)

  render: ->
    @$el.html(@template @model.tplAttrs())
    @

  showUploads: (e) ->
    Backbone.trigger 'engagements:uploading', @model
    e.gesture.srcEvent.preventDefault()

  showAttendance: (e) ->
    Backbone.trigger 'engagements:taking_attendance', @model
    e.gesture.srcEvent.preventDefault()

  back: ->
    Backbone.trigger 'engagements:index'

  saveContent: (e) ->
    window.scroll(0,0)
    key = e.currentTarget.getAttribute('name')
    val = e.currentTarget.value
    attrs = {}
    attrs["#{key}"] = val
    if @model.get(key) != val
      @model.save(attrs)

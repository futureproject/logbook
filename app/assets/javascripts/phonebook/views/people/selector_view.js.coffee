Phonebook.Views.People ||= {}

# selector view needs:
# 1) a model
# 2) the name of an association on that model
class Phonebook.Views.People.SelectorView extends Backbone.View
  initialize: (args) ->
    @association = args.association
    @collection = new Phonebook.Collections.AssociatedPeopleCollection
    @render()
    @initSubViews()
    @listen()

  className:-> "detail detail-modal #{@model.namespace}"

  template: JST['phonebook/templates/people/selector']

  events:
    #'touchend .done': 'done'
    'touchmove .titlebar': (e) -> e.preventDefault()

  listen: ->
    @listenTo Backbone, "people:search:removed", => @done()

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    #Backbone.trigger "people:router:update", (@model.id || @model.cid)
    Backbone.trigger "people:views:shown", 'modal'
    $('#app').append @$el.addClass(animation)
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)

  hide: (animation) ->
    animation ||= 'slide-out-vertical'
    Backbone.trigger "people:views:hidden", @
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )

  render: ->
    @$el.html(@template())
    @$el.find('.scrollable').scrollTop(1)

  initSubViews: () ->
    @subViews =
      search: new Phonebook.Views.Base.SearchView
        namespace: 'people'
        searchAttrs: ['first_name', 'last_name', 'createable']
        container: @$el.find '.multi-select-input-wrapper'
      selection: new Phonebook.Views.People.SelectionView
        model: @model
        association: @association
        collection: @collection
        el: @el.querySelector '.multi-select-selected'

  removeSubviews: ->
    _.each @subViews, (view) -> view.remove()

  remove: ->
    @removeSubviews()
    super

  done: (e) ->
    e?.preventDefault()
    e?.stopPropagation()
    selection = @collection.where({selected: true})
    selection = _.map selection, (m) -> m.attributes
    @model.set(@association, selection)
    @model.save()
    @hide()

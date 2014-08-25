dream.Views.People ||= {}

class dream.Views.People.IndexView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'peopleCollection:changed', @display
    @listenTo Backbone, 'person:show', @addActiveClass

  events:
    'click .new': 'new'
    'click .refresh': 'refresh'
    'click .list-item' : 'showPerson'
    'keyup #person_search' : 'onSearch'
    'click #clear_person_search' : 'clearSearch'

  display: (collection) ->
    @collection = collection
    @listenTo @collection, 'change:first_name change:dream_team change:last_name remove', @render
    @render()

  template: JST['logbook/templates/people/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('.list-items')
    @renderList()
    return this

  renderList: (models) ->
    models ||= @collection.sort().models
    frag = document.createDocumentFragment()
    _.each models, (person) =>
      div = document.createElement('div')
      div.innerHTML = person.name()
      div.setAttribute('data-person-id', person.get('id'))
      div.className = 'list-item'
      frag.appendChild div
    @$list.html(frag)

  new: (e) ->
    e.preventDefault()
    Backbone.trigger 'person:new', @collection

  refresh: (e) ->
    e.preventDefault()
    @collection?.refresh()

  showPerson: (e) ->
    target = e.currentTarget
    return if target.classList.contains('is_active')
    person = @collection.get e.currentTarget.getAttribute('data-person-id')
    Backbone.trigger('person:show', person)

  addActiveClass: (person) ->
    $target = @$el.find("div[data-person-id='#{person.get('id')}']")
    $target.addClass('is_active').siblings().removeClass('is_active')

  onSearch: (e) ->
    $('#clear_person_search').show()
    q = e.currentTarget.value
    if q.length > 1
      results = @collection.sifter.search q,
        limit: 10
        fields: ['first_name', 'last_name']
        sort: [{field: 'dream_team', direction: 'desc'}, {field: 'first_name', direction: 'desc'}]
      people = _.map results.items, (result) =>
        @collection.at(result.id)
      @renderList(people)
    else
      @renderList()

  clearSearch: (e) ->
    $('#person_search').val('')
    e.currentTarget.style.display = 'none'
    @renderList()

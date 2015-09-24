class ds.PeopleContactCardView extends Backbone.View
  template: JST['logbook/templates/people_contact_card']

  events:
    'blur textarea': 'saveBio'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @delegateEvents()

  saveBio: (event) ->
    content = $(event.currentTarget).val()
    content = null if content.length < 1
    @model.save
      bio: content

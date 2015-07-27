class ds.EngagementsFormView extends Backbone.View
  initialize: ->
    @views = {}
    @listenTo @model, 'change', @render
    @listenTo ds.collections.schools, 'reset', @postRender

  events:
    'submit': 'onsubmit'

  template: JST['logbook/templates/engagements_form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @setSchoolOptions()
    Backbone.Syphon.deserialize @, @model.toJSON()
    @selectize
      selector: "#attendee_ids"
      items: @model.get 'attendees'

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @model.set data
    @reflectIdChange() if @model.isNew
    @model.save()
    ds.collections.engagements.add @model, { merge: true }
    ds.router.navigate ds.urlsHelper.urlFor(@model), {trigger: true}

  setSchoolOptions: ->
    fragment = document.createDocumentFragment()
    $f = $(fragment)
    $f.append "<option value></option>"
    ds.collections.schools.each (s) ->
      $f.append "<option value='#{s.get('id')}'>#{s.get('name')}</option>"
    @$el.find('#school_id').html $f

  selectize: (args) ->
    args ||= {}
    $field = $(args.selector)
    items = args.items
    id = "#{$field.attr('id')}_#{_.size(@views)}"
    $frag = $(document.createDocumentFragment())
    _.each items, (item) ->
      $frag.append "<option selected value='#{item.id}'>#{item.first_name} #{item.last_name}</option>"
    $field.append $frag
    @views[id] = new ds.SelectizeView({ el: $field })

  reflectIdChange: ->
    @model.once 'change:id', =>
      ds.router.navigate ds.urlsHelper.urlFor(@model), { trigger: true, replace: true }

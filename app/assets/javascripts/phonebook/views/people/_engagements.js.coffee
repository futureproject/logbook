class ds.People_EngagementsView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change:engagements', @render
    @views = []

  template: JST["phonebook/templates/people/_engagements"]

  events:
    'click .add': 'goToAdd'

  render: ->
    console.log 'rendering engagements!'
    attrs = @model.tplAttrs()
    return @ unless attrs.person.engagements
    @$el.html @template(attrs)
    @postRender()
    @

  postRender: ->
    fragment = document.createDocumentFragment()
    for e in @model.get('engagements')
      view = new ds.EngagementView
        model: new ds.Engagement(e)
      fragment.appendChild view.render().el
      @views.push view
    @$el.find('#engagements-list').html(fragment)

  goToAdd: -> Backbone.trigger "people:do", "add_engagement", @model.get('id')

class ds.EngagementView extends Backbone.View
  events:
    'click .delete': 'delete'

  tagName: 'li'
  template: _.template "
      <h2><%= Date.parse(engagement.date).toString('MM/dd/yy') %> - <%= engagement.kind %></h2>
      <pre class='engagement-description'><%= engagement.description %></pre>
    "
  render: ->
    @$el.html @template(@model.tplAttrs())
    if @model.canBeDeleted()
      @$el.append "<div class='delete'>Delete</div>"
    @

  toggleDelete: (event) ->
    @delete() if @$el.hasClass('deletable')
    @$el.toggleClass('deletable')

  delete: ->
    if @model.canBeDeleted() && confirm("Are you sure you want to delete this engagement?")
      @model.destroy()
      @$el.animate({ height: 0, left: -window.innerWidth}, 'fast', () -> $(this).remove() )
    else
      Backbone.trigger "notification", "You can only delete engagements created this hour."

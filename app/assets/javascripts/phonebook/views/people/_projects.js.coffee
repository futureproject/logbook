class ds.People_ProjectsView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change:projects', @render

  events:
    'click .toggle': 'toggle'

  template: JST["phonebook/templates/people/_projects"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  item_template: _.template "
    <li class='project'>
      <h2><%= name %></h2>
      <pre class='project-description'><%= description %></pre>
    </li>
    "
  postRender: ->
    fragment = $(document.createDocumentFragment())
    for e in @model.get('projects')
      fragment.append @item_template(e)
    @$el.find('#projects-list').html(fragment.get(0))

  toggle: ->
    @$el.toggleClass('expanded')

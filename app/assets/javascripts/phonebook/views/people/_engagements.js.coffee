class ds.People_EngagementsView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change:engagements', @render

  template: JST["phonebook/templates/people/_engagements"]

  events:
    'click .add': 'add'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  item_template: _.template "
    <li class='engagement'>
      <h2><%= Date.parse(date).toString('MM/dd/yy') %> - <%= kind %></h2>
      <div class='engagement-name'><%= name %></div>
      <pre class='engagement-description'><%= description %></pre>
    </li>
    "
  postRender: ->
    fragment = $(document.createDocumentFragment())
    for e in @model.get('engagements')
      fragment.append @item_template(e)
    @$el.find('#engagements-list').html(fragment.get(0))

  add: ->
    console.log 'adding?!'

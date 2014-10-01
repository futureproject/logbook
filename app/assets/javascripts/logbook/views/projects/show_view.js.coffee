dream.Views.Projects ||= {}

class dream.Views.Projects.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'project:show', @display
    @listenTo Backbone, 'project:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/projects/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'project:edit', @model

    'click .person': (e) ->
      id = e.currentTarget.getAttribute('data-id')
      Backbone.trigger 'people:link', "/logbook/people/#{id}"

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'people:getSome',
      ids: @model.get('leader_ids')
      callback: @addLeaders

    Backbone.trigger 'people:getSome',
      ids: @model.get('participant_ids')
      callback: @addParticipants

    Backbone.trigger 'router:update', "logbook/projects/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    @loadNetworkData()
    return @

  hide: ->
    @$el.hide()

  addLeaders: (people) ->
    $('#project_leaders').append("<li class='person' data-id='#{person.get('id')}' >#{person.get('name')}</li>") for person in people

  addParticipants: (people) ->
    $('#project_participants').append("<li class='person' data-id='#{person.get('id')}' >#{person.get('name')}</li>") for person in people

  loadNetworkData: ->
    return unless navigator.onLine
    $('#project-stats').load "/projects/#{@model.get('id')}/stats", (e) ->
      $('.s3-uploader').each ->
        $t = $(this)
        $t.S3Uploader(
          additional_data:
            asset:
              attachable_id: this.getAttribute('data-attachable-id')
              attachable_type: this.getAttribute('data-attachable-type')
        )
        $t.on('ajax:complete', (e, data) ->
          res = JSON.parse data.responseText
          img = '//dream-os-production.s3.amazonaws.com/static-assets/document.png'
          $('.assets').prepend("
            <div class='asset'>
              <a href='#{res.external_url}' target='_blank' >
                <img src='#{img}' alt='#{res.caption}' />
              </a>
              <div class='asset-caption'>#{res.caption}</div>
            </div>
          ")
        )

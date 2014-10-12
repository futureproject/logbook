dream.Views.Engagements ||= {}

class dream.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'engagement:show', @display
    @listenTo Backbone, 'engagement:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/engagements/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'engagement:edit', @model

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'people:getSome',
      ids: @model.get('attendee_ids')
      callback: @addAttendees

    Backbone.trigger 'router:update', "logbook/engagements/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    @loadNetworkData()
    return @

  hide: ->
    @$el.hide()

  addAttendees: (people) ->
    $('#engagement_attendees').append("<li>#{person.name()}</li>") for person in people

  loadNetworkData: ->
    return unless navigator.onLine
    $('#engagement-photos').load "/engagements/#{@model.get('id')}/upload", (e) ->
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



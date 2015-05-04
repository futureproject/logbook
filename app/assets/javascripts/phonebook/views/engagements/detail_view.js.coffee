Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.DetailView extends Phonebook.Views.Base.DetailView

  template: JST['phonebook/templates/engagements/detail']

  listen: ->
    @events['touchend .edit'] = (e) ->
      e.preventDefault()
      Backbone.trigger 'engagements:edit', @model
    @events['touchend .upload'] = @showUploads

  show: (animation) ->
    Backbone.trigger 'engagements:router:update', (@model.id || @model.cid)
    Backbone.trigger 'engagements:views:shown', 'detail'
    super

  hide: (animation) ->
    Backbone.trigger('engagements:views:hidden', @)
    super

  initSubViews: ->
    @subViews = {}
    @subViews.header = new Phonebook.Views.Base.ModelView
      model: @model
      el: @el.querySelector('.engagement-info')
      template: JST['phonebook/templates/engagements/info']

    @subViews.attendance_card = new Phonebook.Views.Engagements.AttendanceCardView
      el: @$el.find('.engagement-attendance')
      model: @model

    assets_card: new Phonebook.Views.Engagements.AssetsCardView
      el: @$el.find('.engagement-assets')
      model: @model


  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'engagements:index'


Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['phonebook/templates/engagements/detail']
  listen: -> @events['touchend .upload'] = @showUploads

  initSubViews: ->
    @subViews =
      header: new Phonebook.Views.Base.ModelView
        model: @model
        el: @el.querySelector('.engagement-info')
        template: JST['phonebook/templates/engagements/info']
      attendance_card: new Phonebook.Views.Engagements.AttendanceCardView
        el: @$el.find('.engagement-attendance')
        model: @model
      assets_card: new Phonebook.Views.Engagements.AssetsCardView
        el: @$el.find('.engagement-assets')
        model: @model

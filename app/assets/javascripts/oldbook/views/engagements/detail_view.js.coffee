Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['oldbook/templates/engagements/detail']

  initSubViews: ->
    @subViews =
      header: new Phonebook.Views.Base.ModelView
        model: @model
        el: @el.querySelector('.engagement-info')
        template: JST['oldbook/templates/engagements/info']
      attendance_card: new Phonebook.Views.Engagements.AttendanceCardView
        el: @$el.find('.engagement-attendance')
        model: @model
      assets_card: new Phonebook.Views.Assets.ModelAssetsView
        model: @model
        el: @$el.find('.engagement-assets')

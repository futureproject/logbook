Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['oldbook/templates/projects/detail']
  header_template: JST['oldbook/templates/projects/header']
  listen: ->
    @events['click .project-leaders'] = 'editLeaders'
    @events['click .project-supporters'] = 'editParticipants'

  initSubViews: (e) ->
    @subViews =
      leaders_card: new Phonebook.Views.Base.ModelView
        el: @el.querySelector('.project-leaders')
        template: JST['oldbook/templates/projects/leaders_card']
        model: @model
      supporters_card: new Phonebook.Views.Base.ModelView
        el: @el.querySelector('.project-supporters')
        template: JST['oldbook/templates/projects/supporters_card']
        model: @model
      assets_card: new Phonebook.Views.Assets.ModelAssetsView
        model: @model
        el: @$el.find('.project-assets')
    super


  editLeaders: -> Backbone.trigger 'projects:leaders', @model
  editParticipants: -> Backbone.trigger 'projects:supporters', @model

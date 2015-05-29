Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['phonebook/templates/projects/detail']
  header_template: JST['phonebook/templates/projects/header']
  listen: ->
    @events['click .project-leaders'] = 'editLeaders'
    @events['click .project-participants'] = 'editParticipants'

  initSubViews: (e) ->
    @subViews =
      leaders_card: new Phonebook.Views.Base.ModelView
        el: @el.querySelector('.project-leaders')
        template: JST['phonebook/templates/projects/leaders_card']
        model: @model
      participants_card: new Phonebook.Views.Base.ModelView
        el: @el.querySelector('.project-participants')
        template: JST['phonebook/templates/projects/participants_card']
        model: @model
      assets_card: new Phonebook.Views.Assets.ModelAssetsView
        model: @model
        el: @$el.find('.project-assets')
    super


  editLeaders: -> Backbone.trigger 'projects:leaders', @model
  editParticipants: -> Backbone.trigger 'projects:participants', @model

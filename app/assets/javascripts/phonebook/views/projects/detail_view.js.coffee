Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['phonebook/templates/projects/detail']
  header_template: JST['phonebook/templates/projects/header']

  initSubViews: (e) ->
    @subViews =
      team_card: new Phonebook.Views.Base.ModelView
        el: @el.querySelector('.project-team')
        template: JST['phonebook/templates/projects/team_card']
        model: @model
      assets_card: new Phonebook.Views.Assets.ModelAssetsView
        model: @model
        el: @$el.find('.project-assets')
    super



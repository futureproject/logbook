Phonebook.Views.People ||= {}

class Phonebook.Views.People.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['phonebook/templates/people/detail']
  header_template: JST['phonebook/templates/people/header']

  initSubViews: ->
    @subViews =
      #notes: new Phonebook.Views.Base.ModelView
        #model: @model
        #el: @el.querySelector('.person-notes')
        #template: JST["phonebook/templates/people/notes"]
      contact: new Phonebook.Views.Base.ModelView
        model: @model
        el: @el.querySelector('.person-contact')
        template: JST["phonebook/templates/people/contact"]
    super

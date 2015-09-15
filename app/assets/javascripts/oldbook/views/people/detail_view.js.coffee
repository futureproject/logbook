Phonebook.Views.People ||= {}

class Phonebook.Views.People.DetailView extends Phonebook.Views.Base.DetailView
  template: JST['oldbook/templates/people/detail']
  header_template: JST['oldbook/templates/people/header']

  initSubViews: ->
    @subViews =
      #notes: new Phonebook.Views.Base.ModelView
        #model: @model
        #el: @el.querySelector('.person-notes')
        #template: JST["oldbook/templates/people/notes"]
      contact: new Phonebook.Views.Base.ModelView
        model: @model
        el: @el.querySelector('.person-contact')
        template: JST["oldbook/templates/people/contact"]
    super

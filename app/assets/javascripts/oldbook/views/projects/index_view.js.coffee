Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.IndexView extends Phonebook.Views.Base.TabView
  template: JST['oldbook/templates/projects/index']
  initSubViews: ->
    @subViews = {}
    @subViews.table = new Phonebook.Views.Base.TableView
      collection: @collection
      el: '#projects-table'
      item_view: Phonebook.Views.Projects.RowView


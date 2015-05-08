Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.IndexView extends Phonebook.Views.Base.TabView
  template: JST['phonebook/templates/projects/index']
  initSubViews: ->
    @subViews = {}
    @subViews.table = new Phonebook.Views.Base.TableView
      collection: @collection
      el: '#projects-table'
      item_view: Phonebook.Views.Projects.RowView

    @searchBar = new Phonebook.Views.Base.SearchView
      collection: @collection
      enablingEvents: 'projects:index'
      disablingEvents: 'projects:show'
      searchAttrs: ['name']

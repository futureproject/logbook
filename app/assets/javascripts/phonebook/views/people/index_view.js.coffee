Phonebook.Views.People ||= {}

class Phonebook.Views.People.IndexView extends Phonebook.Views.Base.TabView
  template: JST['phonebook/templates/people/index']

  initSubViews: ->
    @subViews = {}
    @subViews.table = new Phonebook.Views.Base.TableView
      collection: @collection
      el: '#people-table'
      item_view: Phonebook.Views.People.RowView

    @searchBar = new Phonebook.Views.Base.SearchView
      collection: @collection
      enablingEvents: 'people:index'
      disablingEvents: 'people:show'
      searchAttrs: ['first_name', 'last_name']

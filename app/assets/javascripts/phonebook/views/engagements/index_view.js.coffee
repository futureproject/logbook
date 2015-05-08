Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.IndexView extends Phonebook.Views.Base.TabView
  template: JST['phonebook/templates/engagements/index']

  initSubViews: ->
    @subViews = {}
    @subViews.table = new Phonebook.Views.Base.TableView
      collection: @collection
      el: '#engagements-table'
      item_view: Phonebook.Views.Engagements.RowView


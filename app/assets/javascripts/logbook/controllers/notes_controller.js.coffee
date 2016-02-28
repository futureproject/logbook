class ds.NotesController extends ds.BaseController
  el: "#notes-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "notes:index", @index
    @listenTo Backbone, "notes:new", @new

  index: ->
    ds.collectionHelper.bootstrap ds.collections.notes
    @activate()
    @views.index = new ds.NotesIndexView
    @views.index.renderTo @targetEl

  new: (notable_type, notable_id) ->
    note = new ds.Note
      notable_id: notable_id
      notable_type: notable_type
    @views.new = new ds.NotesNewView
      model: note
    @views.new.render()


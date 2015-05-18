class Phonebook.Models.Project extends Backbone.Model
  className: 'Project'
  namespace: 'projects'
  urlRoot: ds.apiHelper.urlFor 'projects'
  defaults: ->
    leader_ids: []
    participant_ids: []
    school_id: Phonebook.user.get('school_id')
    description: null
    status: 'underway'

# Backbone.DualStorage saves selected state, so ignore it
  parse: (response) -> _.omit response, ['selected']
  #toJSON: ->
    #_.omit _.clone(@attributes), ['selected', 'leaders', 'participants','assets']

  tplAttrs: ->
    attrs = _.clone @attributes
    attrs

class Phonebook.Collections.ProjectsCollection extends Backbone.PageableCollection
  model: Phonebook.Models.Project
  url: -> ds.apiHelper.urlFor 'projects'
  initialize: ->
    @listenToOnce Backbone, 'projects:bootstrap', ->
      ds.bootstrapper.bootstrap @
  mode: 'client'
  state:
    pageSize: 50
  #comparator: 'first_name'

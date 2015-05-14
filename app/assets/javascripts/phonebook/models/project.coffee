class Phonebook.Models.Project extends Backbone.Model
  className: 'Project'
  urlRoot: ds.apiHelper.urlFor 'projects'
  defaults: ->
    #leaders: []
    leader_ids: []
    #participants: []
    participant_ids: []
    school_id: Phonebook.user.get('school_id')

  toJSON: ->
    _.omit _.clone(@attributes), ['selected', 'leaders', 'participants']

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

class Phonebook.Models.Project extends Backbone.Model
  className: 'Project'
  namespace: 'projects'
  urlRoot: ds.apiHelper.urlFor 'projects'
  defaults: ->
    leader_ids: []
    participant_ids: []
    leaders: []
    supporters: []
    school_id: Phonebook.user.get('school_id')
    description: null
    status: 'underway'

# Backbone.DualStorage saves selected state, so ignore it
  parse: (response) -> _.omit response, ['selected']
  #toJSON: ->
    #_.omit _.clone(@attributes), ['selected', 'leaders', 'supporters','assets']

  tplAttrs: ->
    attrs = _.clone @attributes
    attrs

  save: ->
    # rails misinterprets an empty array of association_ids, so give it a blank  string
    l = @get('leaders')
    ids = if l.length == 0 then [''] else _.pluck(l, 'id')
    @set 'leader_ids', ids
    p = @get('supporters')
    ids = if p.length == 0 then [''] else _.pluck(p, 'id')
    @set 'participant_ids', ids
    super

class Phonebook.Collections.ProjectsCollection extends Backbone.PageableCollection
  model: Phonebook.Models.Project
  namespace: 'projects'
  url: -> ds.apiHelper.urlFor @namespace
  mode: 'client'
  state:
    pageSize: 50
  #comparator: 'first_name'

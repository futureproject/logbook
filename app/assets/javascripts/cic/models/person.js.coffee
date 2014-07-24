class dream.Models.Project extends Backbone.Model
  defaults: ->
    name: null
    school_id: dream.USER.school.id

class dream.Collections.Projects extends Backbone.Collection
  model: dream.Models.Project
  url: '/projects'
  initialize: ->

  onChange: ->
    @sort()
    @sendModels(null, null, @lastFilter)
class ds.ScopeHelper
  constructor: ->
    _.extend @, Backbone.Events
    @listenTo Backbone, 'current_scope:get', @current

  current: ->
    attrs = ds.CONSTANTS.scope
    # find out if this is a National, a Site, or a School
    if attrs.namespace == "schools"
      model = new ds.School(attrs)
    else if attrs.namespace == "sites"
      model = new ds.Site(attrs)
    else
      model = new Backbone.Model(attrs)
    @current_scope = model
    Backbone.trigger 'current_scope:got', @current_scope
    @current_scope

ds.scopeHelper = new ds.ScopeHelper

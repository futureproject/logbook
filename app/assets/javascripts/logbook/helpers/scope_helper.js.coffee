ds.scopeHelper =
  getScope: ->
    @current_scope

  setScope: (attrs) ->
    # find out if this is a National, a Site, or a School
    model = switch
      when attrs.namespace == 'schools' then new ds.School(attrs)
      when attrs.namespace == 'sites' then new ds.Site(attrs)
      else new Backbone.Model(attrs)
    @current_scope = model
    Backbone.trigger 'scope:set', @current_scope

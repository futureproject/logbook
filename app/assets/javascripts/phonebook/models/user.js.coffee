class ds.User extends Backbone.Model

class ds.UserCollection extends Backbone.Collection
  local: true
  current: ->
    @first()
  initialize: ->
    @fetch({ reset: true })

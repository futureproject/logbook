class ds.User extends Backbone.Model

class ds.UserCollection extends Backbone.Collection
  url: 'sessions'
  local: true
  current: ->
    @last()
  initialize: ->
    @fetch()

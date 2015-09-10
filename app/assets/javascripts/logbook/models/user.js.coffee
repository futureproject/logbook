class ds.User extends Backbone.Model
  tplAttrs: -> { user: _.clone(@attributes) }

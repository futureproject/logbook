Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendeeView extends Backbone.View
  initialize: (args) ->
    @attrs = args

  render: ->
    @$el.html @template(@attrs)
    @

  template: _.template "<h3><%= name %></h3>"

Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendeeView extends Backbone.View
  initialize: (args) ->
    @attrs = args
    console.log @attrs

  render: ->
    @$el.html @template(@attrs)
    @

  template: _.template "<h3><%= name %></h3>"

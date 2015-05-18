Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.LoadingView extends Backbone.View
  initialize: (args) ->
    args ||= {}
    @message = args.message || "Searched heroically, found nothing :("
    @timeout = args.timeout || 5000
    window.setTimeout @admitDefeat, @timeout

  className: 'loading'

  admitDefeat: =>
    @$el.removeClass('loading').html "<p class='empty-view'>#{@message}</p>"


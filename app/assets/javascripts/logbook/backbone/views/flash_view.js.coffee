window.ds ||= {}

class ds.FlashView extends Backbone.View
  initialize: (args) ->
    message = args.message
    $div = $("<div class='flash'>#{message}</div>")
    $("body").append $div.hide()
    $div.slideDown 'fast', =>
      setTimeout =>
        $div.slideUp 'fast', => @remove()
      , 2000


window.ds ||= {}

class ds.FlashView extends Backbone.View
  initialize: (args) ->
    @message = args.message
    @render()

  className: 'flash'

  template: _.template("
    <div class='flash-message'>
      <%= message %>
      <a href='<%= ds.REDIRECT_URL %>'>Check it out <span class='icon icon-chevron-right'></span></a>
    </div>
    <div class='close'><div class='icon icon-x'></div></div>
  ")

  render: ->
    $("body").append @$el.hide()
    @$el.html @template({message: @message})
    @$el.slideDown 'fast'

  events:
    'click .close': -> @$el.slideUp 'fast', => @remove()


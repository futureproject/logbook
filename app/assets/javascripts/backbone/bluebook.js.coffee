#= require jquery
#= require underscore
#= require backbone
#= require backbone_datalink
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Dreamos =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
  $.ajaxPrefilter (options, originalOptions, jqXHR) ->
    options.url = "/bluebook#{options.url}"
    token = $('meta[name="csrf-token"]').attr('content')
    jqXHR.setRequestHeader('X-CSRF-Token', token) if token
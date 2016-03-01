#= require jquery-2.1.1
#= require underscore-min
#= require backbone-min
#= require backbone.paginator.min
#= require backgrid.min
#= require backgrid-paginator.min
#= require backbone.syphon
#= require jquery.animate-enhanced
#= require date
#= require pikaday
#= require selectize
#= require titlecase
#= require s3_cors_upload
#= require highcharts
#= require highcharts-more
#= require logbook/highcharts.theme
#= require quill.min
#= require_tree ./helpers
#= require_tree ./models
#= require ./controllers/base_controller
#= require_tree ./controllers
#= require_tree ./templates
#= require_tree ./views
#= require ./router
#= require ./app
#= require_self
$ ->
  ds.run()

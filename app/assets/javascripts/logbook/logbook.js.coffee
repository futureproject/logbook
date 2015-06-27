#= require modernizr
#= require jquery
#= require underscore-1.8.3
#= require backbone-1.2.1
#= require selectize
#= require twitter/typeahead
#= require s3_direct_upload
#= require highcharts
#= require highcharts-more
#= require logbook/highcharts.theme
#= require_tree ./helpers
#= require_tree ./views
#= require ./app
#= require_self
$ ->
  ds.run()

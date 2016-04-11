class ds.SelectizeView extends Backbone.View
  initialize: (args) ->
    @settings =
      searchfields: args.searchfields || ['first_name', 'last_name']
      searchspace: args.searchspace || "people"
    @selectize()
    console.log @settings

  template: (item, escape) ->
    if (item.first_name)
      "<div>#{escape(item.first_name + ' ' + item.last_name)}</div>"
    else if item.name
      "<div>#{escape(item.name)}</div>"
    else
      "<div>#{escape(item.text)}</div>"

  selectize: ->
    @$el.selectize
      valueField: 'id'
      searchField: @settings.searchfields
      load: (query, callback) =>
        return callback() if (!query.length)
        $.ajax
          url: "#{ds.apiHelper.urlFor(@settings.searchspace)}?q=#{encodeURIComponent(query)}",
          type: 'GET',
          error: ->
            callback()
          success: (res) ->
            callback(res.data.slice(0,10))

      render:
        item: @template
        option: @template

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
      createFilter: (input) ->
        nameArray = input.split(' ')
        first_name = nameArray.shift()
        last_name = nameArray.join(' ')
        if (first_name?.length > 0 && last_name?.length > 0) then true else false

      create: (input, callback) =>
        name = input.split(' ')
        item =
          id: "person_#{Math.floor(Math.random()*10e3)}"
          last_name: name.pop()
          first_name: name.join(' ')
          name: input
          school_id: $('select[name*=school_id]').val()
        data = {}
        data["#{ds.nounsHelper.singularize(@settings.searchspace)}"] = item
        $.ajax ds.apiHelper.urlFor(@settings.searchspace),
          type: "POST"
          data: data
          complete: (response) =>
            attrs = response.responseJSON
            @el.selectize.updateOption item.id,
              id: attrs.id
              first_name: attrs.first_name
              last_name: attrs.last_name
              name: item.name
            @el.selectize.refreshItems()
        item

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

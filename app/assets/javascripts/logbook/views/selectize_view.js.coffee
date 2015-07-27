class ds.SelectizeView extends Backbone.View
  initialize: ->
    @selectize()

  selectize: ->
    @$el.selectize
      valueField: 'id'
      searchField: ['first_name', 'last_name']
      createFilter: (input) ->
        nameArray = input.split(' ')
        first_name = nameArray.shift()
        last_name = nameArray.join(' ')
        if (first_name?.length > 0 && last_name?.length > 0) then true else false

      create: (input, callback) =>
        name = input.split(' ')
        item =
          id: parseInt(Math.random()*10e16)
          last_name: name.pop()
          first_name: name.join(' ')
          school_id: $('select[name*=school_id]').val()
        $.ajax ds.apiHelper.urlFor('people'),
          type: "POST"
          data:
            person: item
          complete: (response) =>
            attrs = response.responseJSON
            @el.selectize.updateOption item.id,
              id: attrs.id
              first_name: attrs.first_name
              last_name: attrs.last_name
            @el.selectize.refreshItems()
        item


      load: (query, callback) ->
        return callback() if (!query.length)
        $.ajax
          url: "#{ds.apiHelper.urlFor('people')}?q=#{encodeURIComponent(query)}",
          type: 'GET',
          error: ->
            callback()
          success: (res) ->
            callback(res.data.slice(0,10))

      render:
        item: (item, escape) ->
          if (item.first_name)
            "<div>#{escape(item.first_name + ' ' + item.last_name)}</div>"
          else
            "<div>#{escape(item.text)}</div>"
        option: (item, escape) ->
          if (item.first_name)
            "<div>#{escape(item.first_name + ' ' + item.last_name)}</div>"
          else
            "<div>#{escape(item.text)}</div>"

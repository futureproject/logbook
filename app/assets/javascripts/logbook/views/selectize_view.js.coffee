class ds.SelectizeView extends Backbone.View
  initialize: ->
    @selectize()

  selectize: ->
    @$el.selectize
      persist: false
      valueField: 'id'
      searchField: ['first_name', 'last_name']
      createFilter: (input) ->
        nameArray = input.split(' ')
        first_name = nameArray.shift()
        last_name = nameArray.join(' ')
        if (first_name?.length > 0 && last_name?.length > 0) then true else false

      create: (input, callback) =>
        name = input.split(' ')
        item = {}
        $.ajax ds.apiHelper.urlFor('people'),
          type: "POST"
          async: false
          data:
            person:
              last_name: name.pop()
              first_name: name.join(' ')
              school_id: $('select[name*=school_id]').val()
          complete: (response) =>
            res = response.responseJSON
            item =
             id: res.id,
             first_name: res.first_name,
             last_name: res.last_name
        return item


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

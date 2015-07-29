class ds.QuickSearchView extends Backbone.View
  el: '#search-input'
  initialize: ->
    @selectize()
    @listen()

  listen: ->

  selectize: ->
    @$el.selectize
      optgroups: [
        {value: 'Person', label: 'People'},
        {value: 'Project', label: 'Projects'},
        {value: 'Engagement', label: 'Engagements'}
      ],
      dropdownParent: 'body'
      optgroupField: 'class'
      valueField: 'url'
      plugins: ['optgroup_columns']
      onItemAdd: (value, item) =>
        @el.selectize.clear()
        @el.selectize.close()
        @el.selectize.blur()
        ds.router.navigate value, { trigger: true }
      load: (query, callback) ->
        return callback() if (!query.length)
        $.ajax
          url: "#{ds.apiHelper.urlFor('search_results')}?q=#{encodeURIComponent(query)}",
          type: 'GET',
          error: ->
            callback()
          success: (res) ->
            callback(res.slice(0,20))

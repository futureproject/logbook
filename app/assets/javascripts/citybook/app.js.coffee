window.ds = {
  Views: {}
  init: ->
    @views =
      filters: new ds.Views.Filters
        el: '#filters'
      search: new ds.Views.SearchView
        el: '.search-field'
      people_index: new ds.Views.SearchResultsView
        el: '#people-list'
        template: _.template "
          <tr class='person'>
            <td><%= first_name %></td>
            <td><%= last_name %></td>
            <td><%= grade %></td>
            <td><%= school %></td>
          </tr>
        "
  #make a view for searching engagements
}

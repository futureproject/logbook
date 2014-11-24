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
          <tr class='person' id='person_<%= id %>'>
            <td><%= first_name %></td>
            <td><%= last_name %></td>
            <td><%= grade %></td>
            <td><%= school_name %></td>
            <td></td>
            <td>
              <a href='/citybook/people/<%= id %>'>View</a>
              <a href='/citybook/people/<%= id %>/edit'>Edit</a>
              <a href='/citybook/people/<%= id %>' class='warn' data-method='delete' data-confirm='Are you sure you want to delete this person?' data-remote='true'>Delete</a>
            </td>
          </tr>
        "
      new_person_via_search: new ds.Views.NewPersonViaSearchView
        el: '#new_person'

      engagement_people_search: new ds.Views.SearchResultsView
        el: '#engagement-attendance'
        template: _.template "
          <tr class='person'>
            <td><%= first_name %></td>
            <td><%= last_name %></td>
            <td><%= grade %></td>
            <td><%= school_name %></td>
            <td><div class='mark-as-present success btn button' data-id='<%= id %>'>Mark as Present</div></td>
          </tr>
        "
      engagement_attendance: new ds.Views.EngagementAttendanceView
        el: '#engagement-attendance'
}

$('.s3-uploader').each ->
  $t = $(this)
  $t.S3Uploader(
    additional_data:
      asset:
        attachable_id: this.getAttribute('data-attachable-id')
        attachable_type: this.getAttribute('data-attachable-type')
  )
  $t.on('ajax:complete', (e, data) ->
    res = JSON.parse data.responseText
    img = if res.external_url.match(/jpg|png|gif/i)? then res.external_url else '//dream-os-production.s3.amazonaws.com/static-assets/document.png'
    $('.assets').prepend("
      <div class='asset deletable'>
        <a href='#{res.external_url}' target='_blank' >
          <img src='#{img}' alt='#{res.caption}' />
        </a>
        <div class='asset-actions'>
          <div class='asset-caption'>#{res.caption}</div>
          <a href='/api/v1/assets/#{res.id}' data-remote data-method='delete' data-confirm='Are you sure?'>Delete</a>
        </div>
      </div>
    ")
  )

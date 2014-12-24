window.ds ||= {}
$ ->
  ds.hounds =
    people: new Bloodhound
      remote:
        url: '/logbook/people?q=%QUERY'
      datumTokenizer: Bloodhound.tokenizers.whitespace('name')
      queryTokenizer: Bloodhound.tokenizers.whitespace
    projects: new Bloodhound
      remote:
        url: '/logbook/projects?q=%QUERY'
      datumTokenizer: Bloodhound.tokenizers.whitespace('name')
      queryTokenizer: Bloodhound.tokenizers.whitespace
    engagements: new Bloodhound
      remote:
        url: '/logbook/engagements?q=%QUERY'
      datumTokenizer: Bloodhound.tokenizers.whitespace('name')
      queryTokenizer: Bloodhound.tokenizers.whitespace

  ds.hounds.people.initialize()
  ds.hounds.projects.initialize()
  ds.hounds.engagements.initialize()

  $('#search input').typeahead({hint: true, minLength: 1, highlight: true}, {
    name: 'people'
    displayKey: 'name'
    source: ds.hounds.people.ttAdapter()
    templates:
      header: '<h3>People</h3>'
  }, {
    name: 'projects'
    displayKey: 'name'
    source: ds.hounds.projects.ttAdapter()
    templates:
      header: '<h3>Projects</h3>'
  }, {
    name: 'engagements'
    displayKey: 'name'
    source: ds.hounds.engagements.ttAdapter()
    templates:
      header: '<h3>Engagements</h3>'
  }).on('typeahead:selected', (e, data) ->
    if data.url?
      location.href = data.url
  )

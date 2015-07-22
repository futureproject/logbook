class ds.RowLinkView extends Backgrid.Row
  className: 'index-row'
  events:
    'click': 'triggerPermalink'

  triggerPermalink: (e) ->
    if (!(e.which > 1 || e.shiftKey || e.altKey || e.metaKey || e.ctrlKey))
      e.preventDefault()
      url = ds.urlsHelper.urlFor @model
      ds.router.navigate url, { trigger: true }

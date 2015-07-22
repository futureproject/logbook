class ds.RowLinkView extends Backgrid.Row
  events:
    'click': 'triggerPermalink'

  triggerPermalink: (event) ->
    console.log "/logbook/#{@model.namespace}/#{@model.id}"


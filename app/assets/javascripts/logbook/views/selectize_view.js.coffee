window.ds ||= {}
ds.selects = {}

class ds.SelectizeView extends Backbone.View
  initialize: ->
    ds.selects[@el.id] = @$el.selectize
      createFilter: (input) ->
        nameArray = input.split(' ')
        first_name = nameArray.shift()
        last_name = nameArray.join(' ')
        if (first_name?.length > 0 && last_name?.length > 0) then true else false

      create: (input) ->
        name = input.split(' ')
        id = null
        $.ajax '/api/v1/people.json',
          type: "POST"
          async: false
          data:
            person:
              last_name: name.pop()
              first_name: name.join(' ')
              school_id: $('select[name*=school_id]').val()
          success: (response) ->
            id = response.id
          error: (response) ->
            alert(response.responseText)
        { value: id, text: input }



$ ->
  $('select[multiple]').each -> new ds.SelectizeView({ el: this })

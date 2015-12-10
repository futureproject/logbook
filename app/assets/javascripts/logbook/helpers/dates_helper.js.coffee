ds.datesHelper =
  format: (date) ->
    if date
      Date.parse(date).toString('yyyy-MM-dd')
    else
      "XXXX-XX-XX"
  printDuration: (num) ->
    if num <= 1
      "#{Math.round((num*60))} Mins"
    else if num == 1
      "#{num} Hr"
    else
      "#{num} Hrs"

  supportsNativeInput: ->
    i = document.createElement('input')
    i.setAttribute('type', 'date')
    i.type == 'date'

  subtractDays: (date, numDays) ->
    d = new Date()
    d.setTime(date.getTime())
    d.setDate(d.getDate() - numDays)
    d


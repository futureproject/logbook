ds.datesHelper =
  format: (date) ->
    if date
      Date.parse(date).toString('yyyy-MM-dd')
    else
      "XXXX-XX-XX"


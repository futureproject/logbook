ds.datesHelper =
  format: (date) ->
    if date
      Date.parse(date).toString('yyyy-MM-dd')
    else
      "XXXX-XX-XX"
  printDuration: (num) ->
    if num <= 1
      "#{(num*60)} Mins"
    else if num == 1
      "#{num} Hr"
    else
      "#{num} Hrs"


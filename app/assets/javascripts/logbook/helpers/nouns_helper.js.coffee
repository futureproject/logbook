ds.nounsHelper =
  singularize: (noun) ->
    switch noun
      when "people" then "person"
      else noun.slice(0,-1)

  pluralize: (noun) ->
    switch noun
      when "person" then "people"
      else noun + "s"

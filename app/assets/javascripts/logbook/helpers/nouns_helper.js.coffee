ds.nounsHelper =
  singularize: (noun) ->
    noun ||= ""
    switch
      when noun.match(/people/i) then "person"
      else noun.slice(0,-1)

  pluralize: (noun) ->
    noun ||= ""
    switch
      when noun.match(/person/i) then "people"
      else noun + "s"

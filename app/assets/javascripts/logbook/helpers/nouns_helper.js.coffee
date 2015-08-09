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

  contantize: (noun) ->
    noun ||= ""
    switch
      when noun.match(/people|person/i) then "Person"
      when noun.match(/engagement/i) then "Engagement"
      when noun.match(/project/i) then "Project"
      else noun.toTitleCase()

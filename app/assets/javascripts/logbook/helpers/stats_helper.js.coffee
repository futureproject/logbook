ds.statsHelper =
  getStats: (collection) ->
    load = ->
      stats_path = collection.url() + "/stats"
      $.getJSON stats_path, (response) =>
        collection.add response, { merge: true}
        #@grid.sort("name","ascending")
    collection.fetch
      success: => load()

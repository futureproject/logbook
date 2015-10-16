ds.hashtagsHelper =
  linkify: (text) ->
    ptrn = /(?:\s|^)(#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$))([a-z0-9\-_]+))/ig
    hashtagged_content = text.replace ptrn, (match) ->
      "<a href='/logbook/hashtags/#{match.trim().replace("#","")}'>#{match}</a>"
    hashtagged_content

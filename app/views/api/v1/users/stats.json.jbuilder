json.array! @stats do |stat|
  json.label stat[:label]
  json.personal stat[:personal]
  json.site stat[:site]
  json.national stat[:national]
end

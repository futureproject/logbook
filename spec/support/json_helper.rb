module JsonHelper
  def use_json
    request.accept = "application/json"
  end
end

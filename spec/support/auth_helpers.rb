module AuthHelpers

  def mock_auth
    request.accept = "application/json"
    request.cookies[:auth_token] = 'batman'
  end

  def reset_auth
    request.accept = "application/json"
    request.cookies[:auth_token] = nil
  end

  def self.included(base)
    base.fixtures :all
  end

end

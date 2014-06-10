module AuthHelpers

  def mock_auth
    request.cookies[:auth_token] = 'batman'
  end

  def reset_auth
    request.cookies[:auth_token] = nil
  end

  def self.included(base)
    base.fixtures :all
  end

end

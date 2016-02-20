module SessionsHelper
  def returning_to_mobile
    endpoints = %(phonebook_root_path /mobile /logbookapp)
    session[:redirect] && endpoints.include?(session[:redirect])
  end
end

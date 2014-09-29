RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.authorize_with do
    authorize!
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.main_app_name = ["DreamOS", "Admin"]
  config.excluded_models = %w(Identity)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'School' do
    edit do
      field :name
      field :address
      field :dream_director
    end
  end
  config.model 'Site' do
    edit do
      field :name
      field :captain
      field :schools
    end
  end
  config.model 'User' do
    edit do
      field :first_name
      field :last_name
      field :email
      field :auth_token
      field :avatar_url
      field :role
    end
  end
end

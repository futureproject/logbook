module RailsAdmin
  module Config
    module Actions
      class Dedup < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register self
      end
    end
    module Fields::Types
      class Citext < RailsAdmin::Config::Fields::Types::String
        RailsAdmin::Config::Fields::Types::register(:citext, self)
      end
    end
  end

  module Adapters
    module ActiveRecord
      module CitextStatement
        private

          def build_statement_for_type
            if @type == :citext
              return build_statement_for_string_or_text
            else
              super
            end
          end
      end

      class StatementBuilder < RailsAdmin::AbstractModel::StatementBuilder
        prepend CitextStatement
      end

    end
  end
end
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

  config.main_app_name = ["Logbook", "Admin"]
  config.excluded_models = %w(User Identity EngagementAttendee ProjectPerson)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    dedup do
      visible do
        bindings[:abstract_model].model.to_s == "Person"
      end
    end
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
      field :shortname
      field :address
      field :enrollment
      field :active
      field :site
    end
  end
  config.model 'Site' do
    edit do
      field :name
      field :captain
      field :schools
    end
    show do
      field :name
      field :captain
      field :schools
    end
  end
  #config.model 'User' do
    #edit do
      #field :first_name
      #field :last_name
      #field :email
      #field :school
      #field :site
      #field :auth_token
      #field :avatar_url
      #field :role
      #field :banned
    #end
    #list do
      #field :id
      #field :first_name
      #field :last_name
      #field :email
      #field :role
    #end
  #end

end

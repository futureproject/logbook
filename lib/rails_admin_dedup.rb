require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminDedup
end

module RailsAdmin
  module Config
    module Actions
      class Dedup < RailsAdmin::Config::Actions::Base
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.first.class.dedup @objects.pluck(:id)
            flash[:success] = "Records deduped!"

            redirect_to back_or_index
          end
        end
        register_instance_option :collection? do
          true
        end
      end
    end
  end
end


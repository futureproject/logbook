module Sortable
  extend ActiveSupport::Concern

  module ClassMethods
    # Call the class methods with the same name as the keys in <tt>filtering_params</tt>
    # with their associated values. Most useful for calling named scopes from 
    # URL params. Make sure you don't pass stuff directly from the web without 
    # whitelisting only the params you care about first!
    def sort(sort_params)
      results = self.all
      sort_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end

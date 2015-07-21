module Sortable
  extend ActiveSupport::Concern

  module ClassMethods
    def sort(sort_params)
      results = self.all
      sort_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end

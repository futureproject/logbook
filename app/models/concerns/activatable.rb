module Activatable
  extend ActiveSupport::Concern
  included do
    scope :active, -> { where(active: true) }

    def self.default_scope
      self.active
    end
  end
end

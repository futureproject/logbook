module Restrictable
  extend ActiveSupport::Concern

  included do

    # check whether a user can perform an action
    def can(action, record, level=1)
      return false if !(action.present? && record.present?)
      if self.clearance_level >= level
        true
      else
        false
      end
    end

  end
end

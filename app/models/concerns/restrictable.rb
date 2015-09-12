module Restrictable
  extend ActiveSupport::Concern

  included do

    # check whether a user can perform an action
    def can(action, record)
      return false if !(action.present? && record.present?)
      if self.role.match(/admin|chief|dd|lab/i)
        true
      else
        false
      end
    end

  end
end

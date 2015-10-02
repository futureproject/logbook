module Filterable
  extend ActiveSupport::Concern

  included do
    scope :filtered, -> (filter_string) {
      return unless filter_string
      association = filter_string.match /(\w+_count)/
      if !!association
        with_association(association.first
      #([^:]+:+[^:]+(\z|\s)) a pattern to match colon syntax
      if filter_string.match(/_count/i)
        with_association(
      where(filter_string)
    }
  end
end

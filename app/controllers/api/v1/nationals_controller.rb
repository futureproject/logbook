class Api::V1::NationalsController < Api::V1::BaseController
  include Graphable

  private
    def set_scope
      @scope = National.new
    end

end

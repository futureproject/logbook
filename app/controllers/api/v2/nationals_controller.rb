class Api::V2::NationalsController < Api::V2::BaseController
  include Graphable

  private
    def set_scope
      @scope = National.new
    end

end

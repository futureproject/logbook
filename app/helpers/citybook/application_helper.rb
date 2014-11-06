module Citybook::ApplicationHelper
  def scope_params
    params.slice :school_id, :site_id
  end
end

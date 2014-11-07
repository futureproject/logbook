module Citybook::ApplicationHelper
  def scope_params
    params.slice :school_id, :site_id
  end

  def page_classes
    @page_classes || ''
  end
end

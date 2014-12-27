module Logbook::ApplicationHelper

  def scope_params
    params.slice :scope_type, :scope_id
  end

  def scoped_url_for(args)
    url_for(scope_params.merge(args))
  end

end

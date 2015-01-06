module Logbook::ApplicationHelper

  def scope_params
    params.slice :scope_type, :scope_id
  end

  def scoped_url_for(args)
    url_for(scope_params.merge(args))
  end

  def table_link_to name, filter
    filter_is_current = true
    filter.each do |k,v|
      filter_is_current = false if params[k] != v
    end
    link_to_unless filter_is_current, name, scoped_url_for(filter) do
      content_tag(:span, class: 'active') do
        name
      end
    end
  end


end

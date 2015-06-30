module Logbook::ApplicationHelper

  def page_classes
    class_name = params[:controller].gsub('/','_')
    class_name += scope_class(current_scope)
    class_name
  end

  def page_title
    params[:controller].split('/').last.capitalize
  end

  def scope_params
    params.slice :scope_type, :scope_id
  end

  def scoped_url_for(args)
    url_for(scope_params.merge(args))
  end

  def scope_class(scope)
    clss =  " #{scope.class.name.parameterize}_scope_#{scope.id}"
    clss += " site_scope_#{scope.site.id}" if scope.is_a? School
    clss
  end

  def table_link_to name, sort_param
    sort_param_is_current = true
    sort_param.each do |k,v|
      sort_param_is_current = false if params[k] != v
    end
    link_to_unless sort_param_is_current, name, url_for(sort_param) do
      content_tag(:span, class: 'active') do
        name
      end
    end
  end

  def filter_params
    params.slice :in_group, :in_grade
  end

  def filter_link_to name, filter
    filter_is_current = params[filter.first[0]] == filter.first[1] rescue false
    link_to_unless filter_is_current, name, url_for(filter_params.merge(filter)) do
      content_tag(:span, class: 'active') do
        name
      end
    end
  end

  def schools_for(user)
    user.schools.map{|s| [s.name, s.id] }
  end

end

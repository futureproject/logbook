module ApplicationHelper

  def nav_link_to(link_text, link_path, id='')
    class_name = current_page?(link_path) ? 'current' : ''
    content_tag(:li, class: class_name, id: id) do
      link_to raw(link_text), link_path
    end
  end

  def page_title
    "Dream Suite"
  end

  def manifest_path(path_to_manifest)
    if Rails.env.production?
      { manifest: path_to_manifest }
    else
      {}
    end
  end

  def scope_params
    params.slice :school_id, :site_id
  end

  def page_classes
    @page_classes || ''
  end

end

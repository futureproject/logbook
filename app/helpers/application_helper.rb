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
end

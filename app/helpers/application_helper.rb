module ApplicationHelper

  def nav_link_to(link_text, link_path, id='')
    content_tag(:li, class: link_text.downcase, id: id) do
      link_to raw(link_text), link_path, title: link_text
    end
  end

  def map_image_tag(address)
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{address}&zoom=13&scale=2&size=480x240&maptype=terrain&sensor=false&format=png&visual_refresh=true&markers=size:mid%7Ccolor:blue%7Clabel:%7C#{address}"
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


  def page_classes
    @page_classes || ''
  end

end

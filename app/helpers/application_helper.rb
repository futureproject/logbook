module ApplicationHelper
  @@markdowner = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, extensions = {})

  def nav_link_to(link_text, link_path, icon=nil)
    content_tag(:li, class: "nav-item #{link_text.parameterize}", id: "#{link_text.parameterize}-nav-item") do
       if icon
        link_to raw("<span class='link-icon icon-#{icon}'></span> <span class='link-label'>#{link_text}</span>"), link_path, title: link_text
      else
        link_to raw(link_text), link_path, title: link_text
      end
    end
  end

  def map_image_tag(address)
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{address}&zoom=13&scale=2&size=480x240&maptype=terrain&sensor=false&format=png&visual_refresh=true&markers=size:mid%7Ccolor:blue%7Clabel:%7C#{address}"
  end

  def page_title
    "Logbook"
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

  def markdown(text)
    if text
      @@markdowner.render(text)
    else
      ""
    end
  end

  def identity_js_data
    current_identity.as_json(
      only: [:id, :first_name, :last_name, :person_id],
      include: {
        person: {
          only: [
            :id,
            :first_name,
            :last_name,
            :email,
            :role,
            :school_id,
            :site_id
          ]
        }
      }
    )
  end

end

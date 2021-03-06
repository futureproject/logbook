class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true, touch: true
  #validates_presence_of :external_url
  has_attached_file :data
  do_not_validate_attachment_file_type :data
  before_post_process :skip_non_images
  after_create :download_data_later
  after_create :make_a_note
  after_post_process :set_avatar_on_people
  DEFAULT_URL = "//dream-os-production.s3.amazonaws.com/static-assets/avatar-r2.png"

  def kind
    if data_content_type.nil?
      "blank"
    elsif data_content_type.match(/image/i)
      "photo"
    elsif data_content_type.match(/video|movie/i)
      "video"
    elsif data_content_type.match(/audio/i)
      "audio"
    elsif data_content_type.match(/pdf/i)
      "pdf"
    else
      "document"
    end
  end

  def skip_non_images
    !!(data_content_type.match(/image/i))
  end

  def download_data
    return unless data_file_name.nil? && external_url.present?
    self.data = URI.parse(external_url)
    self.save
  end

  def download_data_later
    self.delay.download_data
  end

  # clone this thing if it's attached directly to an engagement
  # and attach the clone to a Note on said Engagement
  def make_a_note
    if attachable_type == "Engagement" && attachable.creator_id
      klone = self.dup
      note = Note.new(
        notable_type: self.attachable.class.name,
        notable_id: self.attachable.id,
        creator_id: self.attachable.creator_id,
        content: self.caption
      )
      note.save!
      klone.attachable = note
      klone.data = URI.parse(external_url)
      klone.save!
      puts "imported #{klone.data_file_name}"
      klone
    end
  end
  handle_asynchronously :make_a_note

  def thumbnail
    generic = ActionController::Base.helpers.asset_path("document.png")
    if data_content_type.nil?
      external_url.match(/jpg|png|gif|svg/i) ? external_url : generic
    elsif !data_content_type.match(/image/)
      generic
    else
      data(:thumb)
    end
  end

  def original
    data_content_type.nil? ? external_url : data(:original)
  end

  # after processing, set person avatar_url
  def set_avatar_on_people
    if attachable_type == "Person"
      attachable.update avatar_url: data(:thumb)
    end
  end

  def log_action
    return if Action.where(subject_id: self.id, subject_type: 'Asset').any?
    Action.create(
      who: attachable.try(:school).try(:dream_director).try(:name),
      what: "uploaded an asset",
      subject_id: id,
      subject_type: "Asset",
      interesting: true,
      school_id: attachable.try(:school).try(:id),
      actor_id: attachable.try(:school).try(:dream_director).try(:id),
      actor_type: "User"
    )
  end

end

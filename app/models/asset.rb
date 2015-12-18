class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true, touch: true
  validates_presence_of :external_url
  default_scope -> { order(id: :desc) }
  has_attached_file :data
  do_not_validate_attachment_file_type :data
  before_post_process :skip_non_images
  after_create :download_data_later
  DEFAULT_URL = "//dream-os-production.s3.amazonaws.com/static-assets/avatar-r2.png"

  def media_type
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

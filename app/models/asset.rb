class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  validates_presence_of :external_url
  default_scope -> { order(id: :desc) }
  has_attached_file :data
  do_not_validate_attachment_file_type :data
  before_post_process :skip_non_images
  after_create :download_data_later
  after_post_process :log_action
  #validates_attachment_content_type :data, :content_type => /\Aimage/
  #

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
    if data_content_type.nil? || !data_content_type.match(/image/i)
      Paperclip::Attachment.default_options[:default_url]
    else
      data(:thumb)
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
      actor_type: "User",
      date: attachable.created_at
    )
  end

end

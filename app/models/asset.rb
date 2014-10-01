class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  validates_presence_of :external_url
  default_scope -> { order(id: :desc) }
  has_attached_file :data
  do_not_validate_attachment_file_type :data
  before_post_process :skip_non_images
  after_create :download_data_later
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

end

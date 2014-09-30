require 'open-uri'
class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  validates_presence_of :external_url
  default_scope -> { order(id: :desc) }
  has_attached_file :data
  do_not_validate_attachment_file_type :data
  after_create :download_data_later
  before_post_process :skip_everything_but_images

  def skip_everything_but_images
    !!(data_content_type.match /image/i)
  end

  def download_data
    true unless data_file_name.nil? && external_url.present?
    self.data = open(external_url)
    self.save
  end

  def download_data_later
    self.delay.download_data
  end
end

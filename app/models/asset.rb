require 'open-uri'
class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  validates_presence_of :external_url
  default_scope -> { order(id: :desc) }
  has_attached_file :data
  #do_not_validate_attachment_file_type :data
  after_create :download_data_later
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def download_data
    return unless data_file_name.nil? && external_url.present?
    self.data = open(external_url)
    self.save
  end

  def download_data_later
    self.delay.download_data
  end
end

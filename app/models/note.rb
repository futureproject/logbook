class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true, touch: true, counter_cache: true
  validates_presence_of :notable_id, :notable_type, :author_id
  belongs_to :author, foreign_key: 'author_id', class_name: 'Person'
  has_many :assets, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :assets
  scope :btw, -> (range) { where(created_at: range) }
  include Hashtaggable
  hashtaggable_attribute :content
end

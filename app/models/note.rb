class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true, touch: true, counter_cache: true, inverse_of: :notes
  validates_presence_of :notable, :creator
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'Person', inverse_of: :created_notes
  has_many :assets, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :assets
  scope :btw, -> (range) { where(created_at: range) }
  include Hashtaggable
  hashtaggable_attribute :content

  def kind
    if assets.count > 0
      css_class = assets.first.kind
      css_class += " gallery" if assets.count > 1
      css_class
    else
      "text"
    end
  end


end

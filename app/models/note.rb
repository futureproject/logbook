class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true, touch: true
  validates_presence_of :notable_id, :notable_type, :user_id
  belongs_to :author, foreign_key: 'user_id', class_name: 'User'
  has_many :assets, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :assets
end

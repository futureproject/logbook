class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true, touch: true
  validates_presence_of :content, :notable_id, :notable_type, :user_id
  belongs_to :author, foreign_key: 'user_id', class_name: 'User'
end

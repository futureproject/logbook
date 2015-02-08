class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true, touch: true
  validates_presence_of :content, :notable_id, :notable_type
end

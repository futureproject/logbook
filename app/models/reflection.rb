class Reflection < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :content, :person_id
  default_scope -> { order(id: :desc) }
end

class Reflection < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :content, :person_id
end

class Report < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :content
end

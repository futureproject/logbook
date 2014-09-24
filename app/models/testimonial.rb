class Testimonial < ActiveRecord::Base
  validates_presence_of :content, :source
  belongs_to :person
end

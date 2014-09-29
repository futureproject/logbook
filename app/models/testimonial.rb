class Testimonial < ActiveRecord::Base
  validates_presence_of :content, :source
  belongs_to :person
  default_scope -> { order(id: :desc) }
end

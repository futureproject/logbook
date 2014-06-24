class Project < ActiveRecord::Base
  validates_presence_of :name, :school_id
  belongs_to :school
end

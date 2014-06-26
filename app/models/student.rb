class Student < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :grade, :school_id
  belongs_to :school

  def name
    "#{first_name} #{last_name}"
  end
end

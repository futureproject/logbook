class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school

  def name
    "#{first_name} #{last_name}"
  end
end

class School < ActiveRecord::Base
  geocoded_by :address
  validates_presence_of :name, :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :set_shortname, :if => lambda{ |obj| obj.name_changed? }

  belongs_to :dream_director, class_name: 'User'
  belongs_to :site

  has_many :students
  has_many :projects


  def set_shortname
    self.shortname = self.name.parameterize
  end

end

class School < ActiveRecord::Base
  geocoded_by :address
  validates_presence_of :name, :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :set_shortname, :if => lambda{ |obj| obj.name_changed? }

  def set_shortname
    self.shortname = self.name.parameterize
  end

end

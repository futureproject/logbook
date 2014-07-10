class School < ActiveRecord::Base
  geocoded_by :address
  validates_presence_of :name, :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :set_shortname, :if => lambda{ |obj| obj.name_changed? }

  belongs_to :dream_director, class_name: 'User', foreign_key: 'dream_director_id'
  belongs_to :site

  has_many :people
  has_many :projects
  has_many :workshops
  has_many :workshop_attendees, through: :workshops
  has_many :one_on_ones


  def set_shortname
    self.shortname = self.name.parameterize
  end

end

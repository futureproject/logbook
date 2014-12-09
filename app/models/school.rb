class School < ActiveRecord::Base
  geocoded_by :address
  validates_presence_of :name, :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :set_shortname, :if => lambda{ |obj| obj.name_changed? }

  #belongs_to :dream_director, class_name: 'User', foreign_key: 'dream_director_id'
  has_many :users
  belongs_to :site

  has_many :people
  has_many :projects
  has_many :project_leaders, through: :projects
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  has_many :one_on_ones, through: :people
  has_many :actions
  has_many :activities, dependent: :destroy


  def set_shortname
    self.shortname = self.name.parameterize
  end

  def dream_director
    users.order(:id).first
  end

end

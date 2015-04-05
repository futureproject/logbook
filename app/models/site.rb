class Site < ActiveRecord::Base
  geocoded_by :name
  validates_presence_of :name
  after_validation :geocode, :if => lambda{ |obj| obj.name_changed? }

  belongs_to :captain, foreign_key: 'captain_id', class_name: 'User'
  has_many :schools
  has_many :users
  has_many :people
  has_many :projects, through: :schools
  has_many :project_leaders, through: :people
  has_many :project_participants, through: :people
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  has_many :actions, through: :schools
  has_many :activities, through: :schools

  def average association, column=nil
    begin
      if column.nil?
        stat = (eval(association.to_s).count.to_f / schools.count.to_f).to_s
      else
        stat = eval(association.to_s).average(column.to_sym)
      end
      stat || 0
    rescue
      0
    end
  end

  def staff
    ([captain] + users).flatten
  end

  def dream_team
    people.where(dream_team: true)
  end

  def person_hours(kind="%")
    engagements.where("kind like ?", kind).where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e| (e.headcount * e.duration).to_i}.inject(:+)
  end

end

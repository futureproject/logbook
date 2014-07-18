class Site < ActiveRecord::Base
  geocoded_by :name
  validates_presence_of :name
  after_validation :geocode, :if => lambda{ |obj| obj.name_changed? }

  belongs_to :captain, foreign_key: 'captain_id', class_name: 'User'
  has_many :schools
  has_many :dream_directors, through: :schools
  has_many :people, through: :schools
  has_many :projects, through: :schools
  has_many :project_leaders, through: :people
  has_many :project_participants, through: :people
  has_many :workshops, through: :schools
  has_many :workshop_attendees, through: :workshops
  has_many :one_on_ones, through: :schools
  has_many :task_assignments, through: :dream_directors

  def average association, column=nil
    begin
      if column.nil?
        (eval(association.to_s).count.to_f / schools.count.to_f).to_s
      else
        eval(association.to_s).average(column.to_sym)
      end
    rescue
      "?"
    end
  end

  def staff
    ([captain] + dream_directors).flatten
  end

end

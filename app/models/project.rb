class Project < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :school, touch: true
  has_many :project_people, dependent: :destroy
  has_many :people, through: :project_people
  has_many :leaders, -> { where(project_people: {leading: true}) }, through: :project_people, source: :person
  has_many :supporters, -> { where(project_people: {leading: false}) }, through: :project_people, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
  COLOR_ENUM = %w(#419AD3 #568099 #064974 #FFAC43 #B66500 #FFEDD6)
  STATUS_ENUM = %w(underway stalled complete)

  include Joinable

end

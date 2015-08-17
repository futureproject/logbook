class Report < ActiveRecord::Base
  has_many :report_assignments, dependent: :destroy
  has_many :sites, through: :report_assignments
  has_many :people, through: :sites
  has_many :report_submissions, dependent: :destroy
  validates_presence_of [:name, :body]

  rails_admin do
    edit do
      field :name
      field :body
      field :sites do
        label 'Assigned Sites'
      end
    end
  end
end

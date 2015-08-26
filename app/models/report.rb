class Report < ActiveRecord::Base
  has_many :report_assignments, dependent: :destroy
  has_many :people, through: :report_assignments
  has_many :report_submissions, dependent: :destroy
  validates_presence_of [:name, :body]

  rails_admin do
    edit do
      field :name
      field :body
      field :people do
        label 'Assigned People'
        associated_collection_cache_all true
        associated_collection_scope do
          Proc.new {|scope|
            scope.where("role=? OR role=?", "DD", "CHIEF")
          }
        end
      end
    end
  end
end

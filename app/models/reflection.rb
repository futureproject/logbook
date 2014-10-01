class Reflection < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :content, :person_id
  default_scope -> { order(id: :desc) }
  has_many :assets, as: :attachable, dependent: :destroy
  after_create :gather_stranded_assets

  def gather_stranded_assets
    self.person.assets.each do |asset|
      asset.update_attributes attachable_type: 'Reflection', attachable_id: self.id
    end
  end

end

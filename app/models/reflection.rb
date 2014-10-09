class Reflection < ActiveRecord::Base
  belongs_to :reflectable, polymorphic: true
  validates_presence_of :content, :reflectable_id
  default_scope -> { order(id: :desc) }
  has_many :assets, as: :attachable, dependent: :destroy
  after_create :gather_stranded_assets

  def gather_stranded_assets
    self.reflectable.assets.each do |asset|
      asset.update_attributes attachable_type: 'Reflection', attachable_id: self.id
    end
  end

  def owned_by?(person, subject)
    if subject.is_a? Person
      person == subject
    elsif subject.is_a? Project
      subject.whole_team.include? person
    else
      false
    end
  end

end

class ChangePeopleAvatarUrlToLongText < ActiveRecord::Migration
  def up
    change_column :people, :avatar_url, :text
    Person.where("avatar_url IS NULL").find_each do |p|
      p.generate_avatar
      p.update_column :avatar_url, p.avatar_url
    end
  end
  def down
    change_column :people, :avatar_url, :string
  end
end

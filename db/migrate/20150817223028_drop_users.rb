class DropUsers < ActiveRecord::Migration
  def up
    User.find_each do |user|
      p = Person.where(email: user.email).first_or_create
      role = user.role.blank? ? "STAFF" : user.role
      p.update(
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        auth_token: user.auth_token,
        avatar_url: user.avatar_url,
        role: role,
        school_id: user.school_id,
        site_id: user.site_id,
      )
      p.update_column :id, user.id
    end
    drop_table :users
  end

  def down
  end

end

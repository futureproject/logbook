class AddFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :phone, :string
    add_column :people, :sex, :string
    add_column :people, :media_consent, :boolean, default: false
    add_column :people, :gpa, :float
  end
end

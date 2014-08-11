class CreateGoRedirects < ActiveRecord::Migration
  def change
    create_table :go_redirects do |t|
      t.string :shortcut
      t.string :url
      t.integer :hit_count

      t.timestamps
    end
    add_index :go_redirects, :shortcut
  end
end

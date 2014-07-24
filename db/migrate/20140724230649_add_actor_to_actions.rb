class AddActorToActions < ActiveRecord::Migration
  def change
    add_column :actions, :actor_id, :integer
    add_column :actions, :actor_type, :string
  end
end

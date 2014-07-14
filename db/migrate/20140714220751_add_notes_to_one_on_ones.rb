class AddNotesToOneOnOnes < ActiveRecord::Migration
  def change
    add_column :one_on_ones, :note, :text
  end
end

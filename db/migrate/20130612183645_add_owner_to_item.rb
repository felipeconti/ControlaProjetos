class AddOwnerToItem < ActiveRecord::Migration
  def up
    add_column :items, :owner_id, :integer
    add_index :items, :owner_id
  end

  def down
    remove_column :items, :owner_id
    remove_index :items, :owner_id
  end
end
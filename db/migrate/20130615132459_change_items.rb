class ChangeItems < ActiveRecord::Migration
  def up
    remove_column :items, :owner_id

    remove_column :items, :priority
  end

  def down
    add_column :items, :owner_id, :integer
    add_index :items, :owner_id

    add_column :items, :priority, :integer
    add_index :items, :priority
  end
end

class ChangeTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :owner_id, :integer
    add_index :tasks, :owner_id

    add_column :tasks, :priority, :integer

    remove_column :tasks, :user_id
  end

  def down
    remove_column :tasks, :owner_id
    remove_index :tasks, :owner_id

    remove_column :tasks, :priority

    add_column :tasks, :user_id, :integer
    add_index :tasks, :user_id
  end
end

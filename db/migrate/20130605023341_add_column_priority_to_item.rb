class AddColumnPriorityToItem < ActiveRecord::Migration
  def up
    add_column :items, :priority, :integer
  end

  def down
    remove_column :items, :priority
  end
end

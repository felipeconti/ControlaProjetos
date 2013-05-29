class AddStateColumnIntoApplication < ActiveRecord::Migration
  def change
    remove_column :tasks, :status
    add_column :tasks, :state_id, :integer

    remove_column :items, :type_id
    add_column :items, :state_id, :integer
  end
end

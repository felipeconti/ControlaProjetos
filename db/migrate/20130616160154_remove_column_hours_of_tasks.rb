class RemoveColumnHoursOfTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :hours
  end

  def down
    add_column  :tasks, :hours, :integer
  end
end

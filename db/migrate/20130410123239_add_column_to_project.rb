class AddColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :date_begin, :datetime
    add_column :projects, :date_end, :datetime
    add_index :projects, :date_begin
    add_index :projects, :date_end
  end
end

class ChangeTypeOfDateOnProject < ActiveRecord::Migration
  def change
    change_column :projects, :date_begin, :date
    change_column :projects, :date_end, :date
  end
end

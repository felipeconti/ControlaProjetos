class AddColumnBrainstormToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :brainstorm, :text
    add_index :projects, :brainstorm
  end
end

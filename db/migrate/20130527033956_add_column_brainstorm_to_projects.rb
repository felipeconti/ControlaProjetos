class AddColumnBrainstormToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :brainstorm, :text
  end
end
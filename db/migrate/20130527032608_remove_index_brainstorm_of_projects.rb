class RemoveIndexBrainstormOfProjects < ActiveRecord::Migration
  def change
    remove_index :projects, :brainstorm
  end
end

class RenameColumnBrainstormToSpecificationOnProject < ActiveRecord::Migration
  def change
     rename_column :projects, :brainstorm, :specification
  end
end

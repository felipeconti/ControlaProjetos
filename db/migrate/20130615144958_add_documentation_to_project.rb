class AddDocumentationToProject < ActiveRecord::Migration
  def up
    add_column :projects, :documentation, :text
  end

  def down
    remove_column :projects, :documentation
  end
end

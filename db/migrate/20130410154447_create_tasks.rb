class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :hours
      t.integer :status
      t.references :project
      t.references :user
      t.references :type

      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks, :user_id
    add_index :tasks, :type_id
  end
end

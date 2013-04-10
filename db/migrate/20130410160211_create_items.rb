class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.float :hour_estimated
      t.float :hour_used
      t.date :date_start
      t.date :date_end
      t.references :task
      t.references :type
      t.references :user

      t.timestamps
    end
    add_index :items, :task_id
    add_index :items, :type_id
    add_index :items, :user_id
  end
end

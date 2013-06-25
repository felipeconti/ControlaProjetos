class CreateTaskAttachments < ActiveRecord::Migration
  def change
    create_table :task_attachments do |t|
      t.references :task

      t.timestamps
    end
    add_index :task_attachments, :task_id
  end
end

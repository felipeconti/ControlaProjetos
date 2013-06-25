class AddAttachmentAssetToTaskAttachments < ActiveRecord::Migration
  def self.up
    change_table :task_attachments do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :task_attachments, :asset
  end
end

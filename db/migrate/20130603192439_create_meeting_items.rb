class CreateMeetingItems < ActiveRecord::Migration
  def up
    create_table :meeting_items do |t|
      t.references :customer
      t.string :subject
      t.text :decision
      t.references :meeting
      t.references :user
      t.references :state
      t.date :date_state

      t.timestamps
    end
    add_index :meeting_items, :customer_id
    add_index :meeting_items, :meeting_id
    add_index :meeting_items, :user_id
    add_index :meeting_items, :state_id
  end

  def down
    drop_table :meeting_items
  end
end

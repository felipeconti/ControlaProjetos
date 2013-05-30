class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.datetime :date_init
      t.datetime :date_end
      t.text :desctiption

      t.timestamps
    end
  end
end

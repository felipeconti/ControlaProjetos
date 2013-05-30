class ChandeNameOfColumnDesctiptionToDescriptionOnMeeting < ActiveRecord::Migration
  def change
    rename_column :meetings, :desctiption, :description
  end
end

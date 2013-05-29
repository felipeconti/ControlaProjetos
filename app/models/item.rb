class Item < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :title, :description,
                  :hour_estimated, :hour_used, :state_id, :user_id

  belongs_to :task
  belongs_to :state
  belongs_to :user

  validates :title, :date_start, :hour_estimated, :user_id, :state_id, presence: true
end

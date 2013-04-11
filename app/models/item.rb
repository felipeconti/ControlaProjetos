class Item < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :hour_estimated, :hour_used, :task_id, :type_id, :user_id
  belongs_to :task
  belongs_to :type
  belongs_to :user
end

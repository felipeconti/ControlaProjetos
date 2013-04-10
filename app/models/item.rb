class Item < ActiveRecord::Base
  belongs_to :task
  belongs_to :type
  belongs_to :user
  attr_accessible :date_end, :date_start, :description, :hour_estimated, :hour_used, :task_id, :type_id, :user_id
end

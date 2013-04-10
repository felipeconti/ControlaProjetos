class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :type
  attr_accessible :description, :hours, :status, :project_id, :user_id, :type_id
end

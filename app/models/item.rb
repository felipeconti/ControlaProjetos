class Item < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :title, :description,
                  :hour_estimated, :hour_used, :state_id, :user_id, :priority

  validates :title, :date_start, :state_id, presence: true

  belongs_to :task
  validates_associated :task

  belongs_to :state
  validates_associated :state

  belongs_to :user
  validates_associated :user

  after_initialize :init

  def init
    self.state_id  ||= 1
    self.priority  ||= 0
  end
end

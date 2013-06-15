class Item < ActiveRecord::Base
  attr_accessible :title, :hour_estimated, :hour_used, :date_start,
                  :date_end, :user_id, :description, :state_id

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
    self.date_start ||= Time.zone.now.to_date
  end
end

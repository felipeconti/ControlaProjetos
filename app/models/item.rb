class Item < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :title, :description,
                  :hour_estimated, :hour_used, :state_id, :user_id

  belongs_to :task
  belongs_to :state
  belongs_to :user

  validates :title, :date_start, :state_id, presence: true

  after_initialize :init

  def init
    self.state_id  ||= 1
  end
end

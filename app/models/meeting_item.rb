class MeetingItem < ActiveRecord::Base
  attr_accessible :subject, :decision, :user_id, :state_id, :date_state

  belongs_to :meeting
  belongs_to :user
  belongs_to :state

  validates :subject, :state_id, presence: true

  after_initialize :init

  def init
    self.state_id  ||= 1
  end
end

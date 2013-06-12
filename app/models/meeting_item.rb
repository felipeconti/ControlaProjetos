class MeetingItem < ActiveRecord::Base
  attr_accessible :customer_id, :subject, :decision, :user_id, :state_id, :date_state

  validates :subject, :state_id, presence: true

  belongs_to :customer
  validates_associated :customer

  belongs_to :meeting
  validates_associated :meeting

  belongs_to :user
  validates_associated :user

  belongs_to :state
  validates_associated :state

  after_initialize :init

  def init
    self.state_id  ||= 1
    self.date_state ||= Time.zone.now.to_date
  end
end

class State < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true

  has_many :tasks
  has_many :items
  has_many :meeting_items
end

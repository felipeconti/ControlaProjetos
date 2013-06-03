class State < ActiveRecord::Base
  attr_accessible :description
  has_many :tasks
  has_many :items
  has_many :meeting_items

  validates :description, presence: true
end

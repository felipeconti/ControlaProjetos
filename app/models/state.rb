class State < ActiveRecord::Base
  attr_accessible :description
  has_many :tasks
  has_many :items

  validates :description, presence: true
end

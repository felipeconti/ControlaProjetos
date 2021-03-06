class Type < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true

  has_many :tasks
end

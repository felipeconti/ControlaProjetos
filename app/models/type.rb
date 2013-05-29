class Type < ActiveRecord::Base
  attr_accessible :description
  has_many :tasks

  validates :description, presence: true
end

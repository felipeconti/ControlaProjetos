class Project < ActiveRecord::Base
  attr_accessible :name, :customer_id
  belongs_to :customer
  has_many :tasks
end

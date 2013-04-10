class Project < ActiveRecord::Base
  attr_accessible :name, :customer_id, :date_begin, :date_end
  belongs_to :customer
end

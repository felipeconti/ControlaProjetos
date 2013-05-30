class Meeting < ActiveRecord::Base
  attr_accessible :date_end, :date_init, :description, :title
end

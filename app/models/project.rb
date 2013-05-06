class Project < ActiveRecord::Base
  attr_accessible :name, :customer_id, :date_begin, :date_end
  belongs_to :customer
  has_many :tasks

  default_scope includes(:tasks)
  def serializable_hash(options = {})
    super include: :tasks
  end

end

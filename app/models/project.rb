class Project < ActiveRecord::Base
  attr_accessible :name, :date_begin, :date_end, :specification

  belongs_to :customer
  has_many :tasks

  default_scope includes(:tasks)
  def serializable_hash(options = {})
    super include: :tasks
  end

  validates :name, :date_begin, presence: true
end

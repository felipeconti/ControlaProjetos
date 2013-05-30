class Task < ActiveRecord::Base
  attr_accessible :title, :hours, :state_id, :user_id, :type_id, :description

  belongs_to :project
  belongs_to :user
  belongs_to :type
  belongs_to :state
  has_many :items

  default_scope includes(:items)
  def serializable_hash(options = {})
    super include: :items
  end

  validates :title, :state_id, :user_id, :type_id, presence: true
end

class Task < ActiveRecord::Base
  attr_accessible :description, :hours, :status, :project_id, :user_id, :type_id
  belongs_to :project
  belongs_to :user
  belongs_to :type
  has_many :items

  default_scope includes(:items)
  def serializable_hash(options = {})
    super include: :items
  end

end

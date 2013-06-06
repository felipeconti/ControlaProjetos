class Meeting < ActiveRecord::Base
  attr_accessible :date_end, :date_init, :description, :title

  validates :title, :date_init, presence: true

  has_many :meeting_items, :dependent => :destroy

  default_scope includes(:meeting_items)
  def serializable_hash(options = {})
    super include: :meeting_items
  end
end

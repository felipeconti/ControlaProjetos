class Task < ActiveRecord::Base
  attr_accessible :title, :hours, :state_id, :type_id, :description

  validates :title, :state_id, :type_id, presence: true

  belongs_to :project
  validates_associated :project

  belongs_to :user
  validates_associated :user

  belongs_to :type
  validates_associated :type

  belongs_to :state
  validates_associated :state

  has_many :items, :dependent => :destroy

  default_scope includes(:items)
  def serializable_hash(options = {})
    super include: :items
  end

  after_initialize :init

  def init
    self.state_id  ||= 1
  end
end

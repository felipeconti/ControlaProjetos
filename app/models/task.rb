class Task < ActiveRecord::Base
  attr_accessible :title, :hours, :type_id, :state_id, :description, :priority

  validates :title, :type_id, :state_id, presence: true

  belongs_to :project
  validates_associated :project

  belongs_to :type
  validates_associated :type

  belongs_to :state
  validates_associated :state

  belongs_to :user
  validates_associated :user

  has_one :owner, :primary_key => "owner_id", :class_name => "User", :foreign_key => "id"

  has_many :items, :dependent => :destroy

  default_scope includes(:items)
  def serializable_hash(options = {})
    super include: :items
  end

  after_initialize :init

  def init
    self.state_id  ||= 1
    self.priority  ||= 0
  end
end

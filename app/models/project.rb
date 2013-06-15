class Project < ActiveRecord::Base
  attr_accessible :name, :date_begin, :date_end, :specification, :documentation

  validates :name, :date_begin, presence: true

  belongs_to :customer
  validates_associated :customer

  has_many :tasks, :dependent => :destroy

  default_scope includes(:tasks)
  def serializable_hash(options = {})
    super include: :tasks
  end

  default_scope order('date_begin DESC')

  after_initialize :init

  def init
    self.date_begin ||= Time.zone.now.to_date
  end
end

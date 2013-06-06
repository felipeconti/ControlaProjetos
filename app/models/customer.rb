class Customer < ActiveRecord::Base
  attr_accessible :address, :enrollment, :complement, :email, :fax, :name,
                  :neighborhood, :nickname, :phone, :mobile, :zip_code

  validates :name, presence: true

  has_many :projects, :dependent => :destroy
  has_many :meeting_items

  default_scope includes(:projects)
  def serializable_hash(options = {})
    super include: :projects
  end
end

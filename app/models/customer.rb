class Customer < ActiveRecord::Base
  attr_accessible :address, :enrollment, :complement, :email, :fax, :name, :neighborhood, :nickname, :phone, :mobile, :zip_code
  has_many :projects

  default_scope includes(:projects)
  def serializable_hash(options = {})
    super include: :projects
  end

  validates :name, presence: true
end

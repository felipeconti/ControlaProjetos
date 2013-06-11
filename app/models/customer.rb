class Customer < ActiveRecord::Base
  attr_accessible :address, :enrollment, :complement, :email, :fax, :name,
                  :neighborhood, :nickname, :phone, :mobile, :zip_code, 
                  :website, :logo

  validates :name, presence: true

  has_many :projects, :dependent => :destroy
  has_many :meeting_items

  default_scope includes(:projects)
  def serializable_hash(options = {})
    super include: :projects
  end

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  
end

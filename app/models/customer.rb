class Customer < ActiveRecord::Base
  include Shared::AttachmentHelper

  def to_param
    "#{id}-#{nickname}"
  end

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
  
  has_attachment :logo, :styles => { :medium => "300x300>",
                                     :small => "50x50>",
                                     :thumb => "30x30>" },
                        :default_url => "/images/:style/missing.png"


  before_post_process :image?
  def image?
    !%w(image/jpg/png).include?(logo_content_type)
  end
  
  default_scope order('name ASC')

end
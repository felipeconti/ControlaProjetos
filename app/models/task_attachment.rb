class TaskAttachment < ActiveRecord::Base

  include Shared::AttachmentHelper

  belongs_to :task
  validates_associated :task

  attr_accessible :asset
  
  validates :asset, presence: true

  has_attachment :asset, :url  => '/system/:rails_env/:class/:attachment/:filename',
                         :path => ':rails_root/public/system/:rails_env/:class/:attachment/:filename'

  before_post_process :image?
  def image?
    !%w(image/jpg/png).include?(asset_content_type)
  end

end
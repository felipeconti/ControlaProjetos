class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :tasks
  has_many :items
  has_many :meeting_items

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end

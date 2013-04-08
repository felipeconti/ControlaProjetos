class Customer < ActiveRecord::Base
  attr_accessible :address, :cnpj_cpf, :complement, :email, :fax, :name, :neighborhood, :nickname, :phone, :mobile, :zip_code
  has_many :projects
end

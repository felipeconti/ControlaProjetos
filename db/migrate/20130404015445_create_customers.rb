class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :nickname
      t.string :address
      t.text :complement
      t.string :neighborhood
      t.integer :zip_code
      t.integer :phone
      t.integer :mobile
      t.integer :fax
      t.integer :cnpj_cpf
      t.string :email

      t.timestamps
    end
  end
end

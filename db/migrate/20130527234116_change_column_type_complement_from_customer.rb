class ChangeColumnTypeComplementFromCustomer < ActiveRecord::Migration
  def change
    change_column :customers, :complement, :string
  end
end

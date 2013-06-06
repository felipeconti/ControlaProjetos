class ChangeLimitOfColumnsPhoneAndMobileOfCustomers < ActiveRecord::Migration
  def up
    change_column :customers, :phone, :integer, :limit => 5
    change_column :customers, :mobile, :integer, :limit => 5
  end

  def down
    change_column :customers, :phone, :integer
    change_column :customers, :mobile, :integer
  end
end

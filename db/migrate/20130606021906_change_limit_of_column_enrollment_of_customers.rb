class ChangeLimitOfColumnEnrollmentOfCustomers < ActiveRecord::Migration
  def up
    change_column :customers, :enrollment, :integer, :limit => 8
  end

  def down
    change_column :customers, :enrollment, :integer
  end
end

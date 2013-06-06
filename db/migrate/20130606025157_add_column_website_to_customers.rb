class AddColumnWebsiteToCustomers < ActiveRecord::Migration
  def up
    add_column :customers, :website, :string
  end

  def down
    remove_column :customers, :website
  end
end

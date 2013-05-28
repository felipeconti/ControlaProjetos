class RenameColumnsOfTables < ActiveRecord::Migration
  def change
    rename_column :customers, :cnpj_cpf, :enrollment
    rename_column :tasks, :description, :title
    rename_column :items, :description, :title
  end
end

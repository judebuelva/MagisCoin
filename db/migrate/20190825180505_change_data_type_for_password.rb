class ChangeDataTypeForPassword < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password, :integer
    rename_column :users, :password, :password_digest
  end
end

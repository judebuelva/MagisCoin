class ChangeUniquenessForContactnum < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :contact_num, :bigint, unique: true
  end
end

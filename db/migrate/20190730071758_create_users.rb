class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.date :birthday
      t.string :role
      t.string :merchant_name
      t.string :owner_fname
      t.string :owner_lname
      t.string :email
      t.integer :contact_num
      t.string :address
      t.float :balance
      t.string :user_type

      t.timestamps
    end
  end
end

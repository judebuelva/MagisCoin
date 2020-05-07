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
      t.string :password_digest
      t.string :question_1
      t.string :question_2
      t.string :question_3

      t.timestamps
    end
  end
end

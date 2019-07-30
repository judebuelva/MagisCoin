class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :send_id
      t.integer :recv_id
      t.string :purchase_type
      t.float :amount
      t.datetime :date_time

      t.timestamps
    end
  end
end

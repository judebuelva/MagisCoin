class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :send_id
      t.integer :recv_id
      t.integer :card_id
      t.float :amount
      t.datetime :time_recorded

      t.timestamps
    end
  end
end

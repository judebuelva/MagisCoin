class CreateBuyLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_loads do |t|
      t.integer :send_id
      t.integer :recv_id
      t.float :amount
      t.datetime :date_time

      t.timestamps
    end
  end
end

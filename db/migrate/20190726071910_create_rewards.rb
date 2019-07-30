class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :merchant_name
      t.string :reward_name
      t.float :reward_value
      t.date :expiry_date

      t.timestamps
    end
  end
end

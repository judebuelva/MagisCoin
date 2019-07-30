class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string :card_name
      t.date :expiry_date
      t.integer :activation_stat

      t.timestamps
    end
  end
end

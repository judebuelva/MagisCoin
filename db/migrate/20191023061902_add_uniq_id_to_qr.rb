class AddUniqIdToQr < ActiveRecord::Migration[5.2]
  def change
    add_column :qrs, :uniq_id, :string
  end
end

class AddSecQuestionstoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :question_1, :string
    add_column :users, :question_2, :string
    add_column :users, :question_3, :string
  end
end

class Transaction < ApplicationRecord
    belongs_to :user_1, foreign_key: "send_id", class_name: "User"
    belongs_to :user_2, foreign_key: "recv_id", class_name: "User"
end

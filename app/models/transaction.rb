class Transaction < ApplicationRecord
    belongs_to :user_1, foreign_key: "send_id", class_name: "User"
    belongs_to :user_2, foreign_key: "recv_id", class_name: "User"

    validates :send_id, presence: true
    validates :recv_id, presence: true
    validates :purchase_type, presence: true
    validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :time_recorded, presence: true
end

class User < ApplicationRecord
    has_one :qr
    has_many :send_transactions, foreign_key: "send_id", class_name: "Transaction"
    has_many :sends, through: :send_transactions, source: :user_1

    has_many :recv_transactions, foreign_key: "recv_id", class_name: "Transaction"
    has_many :recvs, through: :recv_transactions, source: :user_2
end

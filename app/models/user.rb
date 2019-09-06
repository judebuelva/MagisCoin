class User < ApplicationRecord
    has_secure_password
    has_one :qr
    has_many :send_transactions, foreign_key: "send_id", class_name: "Transaction"
    has_many :sends, through: :send_transactions, source: :user_1

    has_many :recv_transactions, foreign_key: "recv_id", class_name: "Transaction"
    has_many :recvs, through: :recv_transactions, source: :user_2

    has_many :card_transactions, foreign_key: "user_id", class_name: "Card"
    has_many :cards, through: :card_transactions, source: :card_id


    validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Please enter right format"}#/\A[\w+\-.]+@[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email,  presence: true, uniqueness: true
  	validates :contact_num, presence: true
  	validates :address, presence: true
  	validates :balance, presence: true, numericality: {greater_than_or_equal_to: 0}
  	validates :user_type, presence: true
    validates :password_digest, presence: true, length: {minimum: 6, maximum: 6}
end

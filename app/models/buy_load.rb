class BuyLoad < ApplicationRecord

  validates :send_id, presence: true, uniqueness: true
  validates :recv_id, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
  
end

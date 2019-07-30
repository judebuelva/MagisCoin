class Reward < ApplicationRecord

  validates :merchant_name, presence: true
  validates :reward_name, presence: true
  validates :reward_value, presence: true
  validates :expiry_date, presence: true
end

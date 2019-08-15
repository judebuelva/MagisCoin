class Card < ApplicationRecord
    

    validates :user_id, presence: true, uniqueness: true
    validates :card_name, presence: true
    validates :expiry_date, presence: true
    validates :activation_stat, presence: true
end

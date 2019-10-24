class Qr < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true, uniqueness: true
    validates :uniq_id, presence: true, uniqueness: true
end

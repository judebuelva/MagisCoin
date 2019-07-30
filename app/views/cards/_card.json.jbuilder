json.extract! card, :id, :user_id, :card_name, :expiry_date, :activation_stat, :created_at, :updated_at
json.url card_url(card, format: :json)

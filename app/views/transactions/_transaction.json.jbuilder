json.extract! transaction, :id, :send_id, :recv_id, :card_id, :amount, :time_recorded, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

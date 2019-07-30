json.extract! purchase, :id, :send_id, :recv_id, :purchase_type, :amount, :date_time, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)

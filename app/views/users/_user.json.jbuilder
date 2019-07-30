json.extract! user, :id, :f_name, :l_name, :birthday, :role, :merchant_name, :owner_fname, :owner_lname, :email, :contact_num, :address, :balance, :user_type, :created_at, :updated_at
json.url user_url(user, format: :json)

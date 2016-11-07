json.extract! account, :id, :amount, :amount_paid, :payday, :lawsuit_id, :client_id, :user_id, :statuspayment_id, :created_at, :updated_at
json.url account_url(account, format: :json)
json.extract! status_payment, :id, :name, :created_at, :updated_at
json.url status_payment_url(status_payment, format: :json)
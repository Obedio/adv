json.extract! lawsuit, :id, :number, :assessment, :description, :amount, :user_id, :client_id, :venue_id, :kind_id, :status_id, :created_at, :updated_at
json.url lawsuit_url(lawsuit, format: :json)
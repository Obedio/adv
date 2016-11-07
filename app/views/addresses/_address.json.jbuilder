json.extract! address, :id, :street, :district, :city, :state, :country, :zipcode, :addresstype_id, :created_at, :updated_at
json.url address_url(address, format: :json)
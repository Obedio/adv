json.extract! client, :id, :name, :born, :sex, :cpf, :rg, :email, :telephone, :celphone, :bio, :address_id, :user_id, :created_at, :updated_at
json.url client_url(client, format: :json)
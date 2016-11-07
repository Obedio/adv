json.extract! data_user, :id, :name, :born, :sex, :office_id, :user_id, :created_at, :updated_at
json.url data_user_url(data_user, format: :json)
json.extract! profile, :id, :name, :last_name, :birth, :sex, :user_id, :office_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
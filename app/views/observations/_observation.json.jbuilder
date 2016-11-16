json.extract! observation, :id, :description, :lawsuit_id, :created_at, :updated_at
json.url observation_url(observation, format: :json)
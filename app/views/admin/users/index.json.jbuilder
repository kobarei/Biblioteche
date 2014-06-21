json.array!(@users) do |user|
  json.extract! user, :id, :name, :library_id, :login_id, :age
  json.url user_url(user, format: :json)
end

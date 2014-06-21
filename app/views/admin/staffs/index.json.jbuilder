json.array!(@staffs) do |staff|
  json.extract! staff, :id, :name, :library_id, :login_id
  json.url staff_url(staff, format: :json)
end

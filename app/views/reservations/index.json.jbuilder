json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user_id, :publication_id, :expire_at, :expired
  json.url reservation_url(reservation, format: :json)
end

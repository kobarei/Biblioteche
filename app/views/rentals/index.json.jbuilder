json.array!(@rentals) do |rental|
  json.extract! rental, :id, :user_id, :publication_id, :expire_at, :expired
  json.url rental_url(rental, format: :json)
end

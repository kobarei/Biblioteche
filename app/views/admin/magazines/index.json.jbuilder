json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :library_id, :age_limit, :status, :author, :name, :count, :remain, :issn, :interval
  json.url magazine_url(magazine, format: :json)
end

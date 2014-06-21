json.array!(@publications) do |publication|
  json.extract! publication, :id, :library_id, :isbn, :issn, :age_limit, :status
  json.url publication_url(publication, format: :json)
end

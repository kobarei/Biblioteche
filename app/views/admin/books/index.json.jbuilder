json.array!(@books) do |book|
  json.extract! book, :id, :library_id, :age_limit, :status, :author, :name, :count, :remain, :isbn
  json.url book_url(book, format: :json)
end

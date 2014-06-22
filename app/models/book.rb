class Book < Publication
  self.table_name = 'books'

  validates :isbn, presence: true
end

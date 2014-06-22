class Magazine < Publication
  self.table_name = 'magazines'

  validates :issn, presence: true
  validates :interval, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

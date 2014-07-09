class Publication < ActiveRecord::Base
  self.inheritance_column = 'category'

  belongs_to :library
  has_many :borrowings

  enum status: %i(available away)

  validates :library_id, presence: true
  validates :age_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :library, -> library { where library_id: library.try(:id) }

  before_save do
    self.count     ||= 0
    self.stock     ||= self.count
    self.age_limit ||= 0
  end

  after_create do
    available!
  end

  def borrowings
    Borrowing.alive.where "#{self.class.name.downcase}_id" => id
  end

  def reservations
    Reservation.alive.where "#{self.class.name.downcase}_id" => id
  end

  class << self
    def search(query)
      ret = {}
      books = Book.where(Book.arel_table[:name].eq(query).or(Book.arel_table[:author].eq(query)).or(Book.arel_table[:isbn].eq(query)))
      magazines = Magazine.where(Magazine.arel_table[:name].eq(query).or(Magazine.arel_table[:author].eq(query)).or(Magazine.arel_table[:issn].eq(query)))
      ret[:books] = if books.present? then books else [] end
      ret[:magazines] = if magazines.present? then magazines else [] end
      return ret
    end
  end

  def update_status
    if stock > 0
      available!
    else
      away!
    end
    save
  end

  def obtain_stock_quantity
    self.stock
  end

  def increment_stock_quantity_by_1
    self.stock += 1
    self.update_status
  end

  def decrement_stock_quantity_by_1
    self.stock -= 1
    self.update_status
  end

end

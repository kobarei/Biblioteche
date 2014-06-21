class Publication < ActiveRecord::Base
  belongs_to :library
  has_many :rentals
  has_many :reservations

  enum status: %i(available away)

  scope :library, -> library { where library_id: library.try(:id) }
  scope :books, -> { where issn: "" }
  scope :magazines, -> { where isbn: "" }

  before_save do
    count  ||= 0
    remain ||= count
  end

  after_create do
    available!
  end

  def rentals
    Rental.alive.remain id
  end

  def reservations
    Reservation.alive.remain id
  end

  def update_status
    if remain > 0
      available!
    else
      away!
    end
    save
  end

end

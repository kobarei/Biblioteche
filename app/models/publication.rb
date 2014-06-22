class Publication < ActiveRecord::Base
  belongs_to :library
  has_many :rentals
  has_many :reservations

  enum status: %i(available away)

  validates :library_id, presence: true
  validates :age_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate on: [:create, :update] do
    errors.add(:base, "ISBNかISSNはどちらかひとつ入力してください") unless only_one_categorized?
  end

  scope :library, -> library { where library_id: library.try(:id) }
  scope :books, -> { where issn: "" }
  scope :magazines, -> { where isbn: "" }

  before_save do
    self.count     ||= 0
    self.remain    ||= self.count
    self.age_limit ||= 0
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

  def book?
    return true if issn == ""
    false
  end

  def magazine?
    return true if isbn == ""
    false
  end

  private

  def only_one_categorized?
    return true if book? ^ magazine?
    false
  end

end

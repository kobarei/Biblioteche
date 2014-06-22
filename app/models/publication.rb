class Publication < ActiveRecord::Base
  belongs_to :library
  has_many :lendings
  has_many :reservations

  self.inheritance_column = 'category'

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
    if self.issn.blank?
      self.category = 'Book'
    elsif self.isbn.blank?
      self.category = 'Magazine'
    end
  end

  after_create do
    available!
  end

  def lendings
    Lending.alive.remain id
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
    return true if issn.blank?
    false
  end

  def magazine?
    return true if isbn.blank?
    false
  end

  private

  def only_one_categorized?
    return true if book? ^ magazine?
    false
  end

end

class Publication < ActiveRecord::Base
  self.inheritance_column = 'category'

  belongs_to :library
  has_many :lendings

  enum status: %i(available away)

  validates :library_id, presence: true
  validates :age_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :library, -> library { where library_id: library.try(:id) }

  before_save do
    self.count     ||= 0
    self.remain    ||= self.count
    self.age_limit ||= 0
  end

  after_create do
    available!
  end

  def lendings
    Lending.alive.where "#{self.class.name.downcase}_id" => id
  end

  def reservations
    Reservation.alive.where "#{self.class.name.downcase}_id" => id
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

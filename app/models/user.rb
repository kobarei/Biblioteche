class User < ActiveRecord::Base
  has_secure_password

  belongs_to :library
  has_many :rentals
  has_many :reservations

  validates :name, presence: true
  validates :login_id, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create
  validates :library_id, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def rentalable?(publication, reservation)
    return true if
      publication.remain > 0 ||
      publication.reservations.take(publication.count - publication.rentals.count).find { |res| res == reservation }
    false
  end

end

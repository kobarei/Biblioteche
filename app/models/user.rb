class User < ActiveRecord::Base
  has_secure_password
  belongs_to :library
  has_many :rentals
  has_many :reservations

  def rentalable?(publication, reservation)
    return true if
      publication.remain > 0 ||
      publication.reservations.take(publication.count - publication.rentals.count).find { |res| res == reservation }
    false
  end

end

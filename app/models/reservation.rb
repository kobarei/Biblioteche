class Reservation < ActiveRecord::Base
  include Biblio::BorrowingReservation

  validate on: :create do
    errors.add(:base, "すでに予約しています") unless no_publication_reservation?
  end

  def no_publication_reservation?
    return true if Reservation.alive.user_publication(user, publication).blank?
    false
  end

end

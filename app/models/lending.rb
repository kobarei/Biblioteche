class Lending < ActiveRecord::Base
  include Biblio::LendingReservation

  validate on: :create do
    errors.add(:base, "借りるには予約する必要があります") unless no_need_reservation?
  end

  after_create do
    reservation = Reservation.alive.user_publication(user, publication)
    reservation.destroy if reservation.present?
  end

end

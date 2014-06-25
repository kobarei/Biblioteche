class Reservation < ActiveRecord::Base
  include Biblio::LendingReservation

  validate on: :create do
    errors.add(:base, "すでに予約しています") unless no_publication_reservation?
  end

end

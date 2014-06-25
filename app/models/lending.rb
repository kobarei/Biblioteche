class Lending < ActiveRecord::Base
  include Biblio::LendingReservation

  validate on: :create do
    errors.add(:base, "借りるには予約する必要があります") unless no_need_reservation?
    errors.add(:base, "レンタル上限に達しています") unless no_max_reached?
  end

  after_create do
    reservation = Reservation.alive.user_publication(user, publication)
    reservation.destroy if reservation.present?
  end

  def no_need_reservation?
    return true if user.lendingable_position? publication, Reservation.alive.user_publication(user, publication)
    false
  end

end

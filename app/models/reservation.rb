class Reservation < ActiveRecord::Base
  include Biblio::BorrowingReservation

  validate on: :create do
    errors.add(:base, "すでに予約しています") unless no_publication_reservation?
  end

  scope :alive, -> { where expired_at: nil }
  scope :expired, -> { where.not expired_at: nil }

  before_create do
    self.expire_at = obtain_the_receipt_deadline
  end

  def no_publication_reservation?
    return true if Reservation.alive.user_publication(user, publication).blank?
    false
  end

  def obtain_the_resevation_date
    DateTime.now
  end

  def obtain_the_receipt_deadline
    DateTime.now.end_of_day + 1.week
  end

end

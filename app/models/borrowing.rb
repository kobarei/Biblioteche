class Borrowing < ActiveRecord::Base
  include Biblio::BorrowingReservation

  has_one :return

  validate on: :create do
    errors.add(:base, "借りるには予約する必要があります") unless no_need_reservation?
    errors.add(:base, "レンタル上限に達しています") unless no_max_reached?
  end

  scope :alive, -> { where return_id: nil }
  scope :expired, -> { where.not return_id: nil }


  before_create do
    self.expire_at = obtain_the_due_date
  end

  after_create do
    reservation = Reservation.alive.user_publication(user, publication)
    reservation.destroy if reservation.present?
  end

  def no_need_reservation?
    return true if user.borrowingable_position? publication, Reservation.alive.user_publication(user, publication)
    false
  end

  def obtain_the_lending_date
    DateTime.now
  end

  def obtain_the_due_date
    DateTime.now.end_of_day + 1.week
  end

end

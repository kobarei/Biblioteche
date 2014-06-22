class Rental < ActiveRecord::Base
  include Biblio::RentalReservation

  belongs_to :user
  belongs_to :publication

  validate on: :create do
    errors.add(:base, "年齢制限がかかっています")       unless pass_age_limit?
    errors.add(:base, "不正な蔵書です")               unless proper_library?
    errors.add(:base, "借りるには予約する必要があります") unless need_reservation?
    errors.add(:base, "すでにレンタルしています")       unless no_publication_rental?
  end

  scope :alive, -> { where expired_at: nil }
  scope :expired, -> { where.not expired_at: nil }
  scope :remain, -> publication_id { where publication_id: publication_id }

  before_create do
    self.expire_at = 7.days.since.end_of_day
  end

  after_create do
    publication.remain -= 1
    publication.update_status
    reservation = Reservation.alive.user_publication(user, publication)
    reservation.destroy if reservation.present?
  end

end

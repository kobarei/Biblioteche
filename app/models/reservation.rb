class Reservation < ActiveRecord::Base
  include Biblio::LendingReservation

  belongs_to :user
  belongs_to :book
  belongs_to :magazine

  validate on: :create do
    errors.add(:base, "年齢制限がかかっています") unless pass_age_limit?
    errors.add(:base, "不正な蔵書です")         unless proper_library?
    errors.add(:base, "すでに予約しています")    unless no_publication_reservation?
    errors.add(:base, "すでにレンタルしています") unless no_publication_lending?
  end

  scope :alive, -> { where expired_at: nil }
  scope :expired, -> { where.not expired_at: nil }

  before_create do
    self.expire_at = 7.days.since.end_of_day
  end

  after_create do
    publication = book || magazine
    publication.remain -= 1
    publication.update_status
  end

end

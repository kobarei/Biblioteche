class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication

  validate on: :create do
    errors.add(:publication, "年齢制限がかかっています")  unless user.age >= publication.age_limit
    errors.add(:publication, "不正な蔵書です")          unless publication.library == user.library
    errors.add(:reservations, "すでに予約しています")    unless Reservation.alive.user_publication(user, publication).blank?
    errors.add(:reservations, "すでにレンタルしています") unless Rental.alive.user_publication(user, publication).blank?
  end

  scope :alive, -> { where expired_at: nil }
  scope :expired, -> { where.not expired_at: nil }
  scope :remain, -> publication_id { where publication_id: publication_id }
  scope :user_publication, -> user, publication { find_by user_id: user.id, publication_id: publication.id }

  before_create do
    self.expire_at = 7.days.since.end_of_day
  end

  after_create do
    publication.remain -= 1
    publication.update_status
  end

  def destroy
    update expired_at: Time.now
    publication.remain += 1
    publication.update_status
  end

end

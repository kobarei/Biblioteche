class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication

  validate on: :create do
    errors.add(:base, "年齢制限がかかっています") unless pass_age_limit?
    errors.add(:base, "不正な蔵書です")         unless proper_library?
    errors.add(:base, "すでに予約しています")    unless no_publication_reservation?
    errors.add(:base, "すでにレンタルしています") unless no_publication_rental?
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
  end

  class << self
    def user_publication(user, publication)
      find_by user_id: user.id, publication_id: publication.id
    end
  end

  def destroy
    update expired_at: Time.now
    publication.remain += 1
    publication.update_status
  end

  private

  def pass_age_limit?
    return true if user.age >= publication.age_limit
    false
  end

  def proper_library?
    return true if publication.library == user.library
    false
  end

  def no_publication_reservation?
    return true if Reservation.alive.user_publication(user, publication).blank?
    false
  end

  def no_publication_rental?
    return true if Rental.alive.user_publication(user, publication).blank?
    false
  end

end

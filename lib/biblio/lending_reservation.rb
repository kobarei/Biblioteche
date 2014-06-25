module Biblio
  module LendingReservation

    def self.included(base)
      base.extend(ClassMethods)

      base.class_eval {
        belongs_to :user
        belongs_to :book
        belongs_to :magazine

        validate on: :create do
          errors.add(:base, "年齢制限がかかっています") unless pass_age_limit?
          errors.add(:base, "不正な蔵書です")         unless proper_library?
          errors.add(:base, "すでにレンタルしています") unless no_publication_lending?
        end

        scope :alive, -> { where expired_at: nil }
        scope :expired, -> { where.not expired_at: nil }
        scope :user, -> user_id { where user_id: user_id }

        before_create do
          self.expire_at = 7.days.since.end_of_day
        end

        after_create do
          publication.remain -= 1
          publication.update_status
        end

      }
    end

    module ClassMethods
      def user_publication(user, publication)
        find_by :user_id => user.id, "#{publication.class.name.downcase}_id" => publication.id
      end
    end

    def destroy
      update expired_at: Time.now
      publication.remain += 1
      publication.update_status
    end

    def publication
      book || magazine
    end

    private

    def pass_age_limit?
      return true if user.age >= publication.age_limit
      false
    end

    def proper_library?
      return true if publication.library_id == user.library_id
      false
    end

    def no_publication_lending?
      return true if Lending.alive.user_publication(user, publication).blank?
      false
    end

    def no_max_reached?
      return true if self.class.alive.user(user_id).count < 10
      false
    end

  end
end

module Biblio
  module BorrowingReservation

    def self.included(klass)
      klass.extend ClassMethods

      klass.class_eval {
        belongs_to :user
        belongs_to :book
        belongs_to :magazine

        validate on: :create do
          errors.add(:base, "年齢制限がかかっています") unless pass_age_limit?
          errors.add(:base, "不正な蔵書です")         unless proper_library?
          errors.add(:base, "すでにレンタルしています") unless no_publication_borrowing?
        end

        scope :user, -> user_id { where user_id: user_id }

        after_create do
          publication.decrement_stock_quantity_by_1
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
      publication.increment_stock_quantity_by_1
    end

    def publication
      book || magazine
    end

    def pass_age_limit?
      return true if user.age >= publication.age_limit
      false
    end

    def proper_library?
      return true if publication.library_id == user.library_id
      false
    end

    def no_publication_borrowing?
      return true if Borrowing.alive.user_publication(user, publication).blank?
      false
    end

    def no_max_reached?
      return true if self.class.alive.user(user_id).count < 10
      false
    end

  end
end

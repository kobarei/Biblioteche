module Biblio
  module LendingReservation

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def user_publication(user, publication)
        find_by user_id: user.id, "#{publication.class.name.downcase}_id" => publication.id
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
      publication = book || magazine
      return true if user.age >= publication.age_limit
      false
    end

    def proper_library?
      publication = book || magazine
      return true if publication.library_id == user.library_id
      false
    end

    def need_reservation?
      publication = book || magazine
      return true if user.lendingable_position? publication, Reservation.alive.user_publication(user, publication)
      false
    end

    def no_publication_reservation?
      publication = book || magazine
      return true if Reservation.alive.user_publication(user, publication).blank?
      false
    end

    def no_publication_lending?
      publication = book || magazine
      return true if Lending.alive.user_publication(user, publication).blank?
      false
    end

  end
end

module ApplicationHelper
  include Biblio::Subdomain

  def rentalable?(user, publication, reservation)
    user.rentalable_position? publication, reservation
  end
end

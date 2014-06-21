module ApplicationHelper
  include Biblio::Subdomain

  def rentalable?(user, publication, reservation)
    user.rentalable? publication, reservation
  end
end

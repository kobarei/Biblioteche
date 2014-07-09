module ApplicationHelper
  include Biblio::Subdomain

  def borrowingable?(user, publication, reservation)
    user.borrowingable_position? publication, reservation
  end
end

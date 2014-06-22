module ApplicationHelper
  include Biblio::Subdomain

  def lendingable?(user, publication, reservation)
    user.lendingable_position? publication, reservation
  end
end

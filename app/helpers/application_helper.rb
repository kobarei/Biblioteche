module ApplicationHelper
  include Biblio::Subdomain

  def borrowingable?(user, publication, reservation)
    user.borrowingable_position? publication, reservation
  end

  def show_menu
    render 'partials/select_menu'
  end

  def show_search_box
    render "partials/searchbox"
  end

  def show_the_publication_list
    render "partials/publications_list"
  end

  def choose_a_publication(pub)
    link_to 'Show', pub
  end

  def show_the_status_of_publication(pub)
    pub.status
  end

  def show_error_message(son)
    render "partials/error_message", son: son
  end

  def show_search_result
    render "partials/search_result"
  end
end

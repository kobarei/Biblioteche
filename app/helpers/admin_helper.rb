module AdminHelper
  include Biblio::Subdomain

  def submit_information_of_publication(information)
    information.submit
  end

  def show_the_publication_list
    render "admin/partials/publications_list"
  end
end

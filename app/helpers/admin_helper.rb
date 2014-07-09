module AdminHelper
  include Biblio::Subdomain

  def show_the_publication_list
    render "admin/partials/publications_list"
  end
end

module ApplicationHelper
  include Biblio::Subdomain

  def borrowingable?(user, publication, reservation)
    user.borrowingable_position? publication, reservation
  end

  def show_menu
    render 'partials/select_menu'
  end

  def choose_operation(str)
    link_to str, '#', 'data-toggle' => "modal", 'data-target' => "#myModal"
  end

  def show_search_box
    render "partials/searchbox"
  end

  def input_search_query
    text_field_tag :q, params[:q], class: "form-control col-lg-8", placeholder: "Search"
  end

  def scan_publication
    # バーコード読み取り機能を追加した時のためのメソッド
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

  def show_error_message(model)
    render "partials/error_message", model: model
  end

  def show_search_result_message
    render "partials/search_result"
  end
end

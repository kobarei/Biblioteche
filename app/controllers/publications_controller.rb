class PublicationsController < ApplicationController
  before_action :obtain_the_detail_of_publication, only: [:show]

  # GET /publications
  def index
    create_the_publication_list
  end

  # GET /publications/1
  def show
  end

  def search_publication(query)
    Publication.search query
  end

  def create_the_publication_list
    if params[:q].present?
      pubs = search_publication params[:q]
      @books       = pubs[:books]
      @magazines   = pubs[:magazines]
    else
      @books = Book.library current_library
      @magazines = Magazine.library current_library
    end
  end

  def check_the_status_of_publication
    @publication.status
  end

  def obtain_the_detail_of_publication
    @publication = Publication.find(params[:id])
  end

  def judge_whether_available_or_not
    return true if pass_age_limit? && proper_library? && no_publication_borrowing? && no_max_reached?
    false
  end

  def create_as_processing_date
    DateTime.now
  end

end

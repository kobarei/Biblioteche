class PublicationsController < ApplicationController
  before_action :obtain_the_detail_of_publication, only: [:show]

  # GET /publications
  def index
    create_the_publication_list
  end

  # GET /publications/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def obtain_the_detail_of_publication
      @publication = Publication.find(params[:id])
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
end

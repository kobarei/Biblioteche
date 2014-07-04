class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  # GET /publications
  def index
    if params[:q].present?
      pubs = Publication.search(params[:q])
      @books       = pubs[:books]
      @magazines   = pubs[:magazines]
    else
      @books = Book.library current_library
      @magazines = Magazine.library current_library
    end
  end

  # GET /publications/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end
end

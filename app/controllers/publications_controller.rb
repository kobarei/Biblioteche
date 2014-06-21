class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  # GET /publications
  # GET /publications.json
  def index
    @books = Publication.books.library current_library
    @magazines = Publication.magazines.library current_library
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end
end

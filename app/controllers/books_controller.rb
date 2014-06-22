class BooksController < ApplicationController
  before_action :set_book, only: :show

  # GET /books/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
end

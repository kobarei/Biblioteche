class Admin::PublicationsController < AdminController

  # GET /publications
  def index
    @books = Book.library current_library
    @magazines = Magazine.library current_library
  end

end

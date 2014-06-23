class Admin::BooksController < AdminController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_library_to_params, only: :create

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to [:admin, @book], notice: 'Publication was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to [:admin, @book], notice: 'Publication was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_publications_url, notice: 'Book was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_library_to_params
      params[:book][:library_id] = current_staff.library_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:library_id, :age_limit, :status, :author, :name, :count, :remain, :isbn)
    end
end

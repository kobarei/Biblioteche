class Admin::PublicationsController < AdminController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_library_to_params, only: :create

  # GET /publications
  def index
    @books = Book.library current_library
    @magazines = Magazine.library current_library
  end

  # GET /publications/1
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to [:admin, @publication], notice: 'Publication was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /publications/1
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to [:admin, @publication], notice: 'Publication was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to admin_publications_url, notice: 'Publication was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def set_library_to_params
      params[:publication][:library_id] = current_staff.try(:library_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(
        :name, :author, :library_id, :isbn, :issn, :interval, :age_limit, :count, :remain, :category
      )
    end
end

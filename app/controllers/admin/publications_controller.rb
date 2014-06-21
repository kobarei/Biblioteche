class Admin::PublicationsController < AdminController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_library_to_params, only: :create

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

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
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
  # PATCH/PUT /publications/1.json
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
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def set_library_to_params
      params[:publication][:library_id] = current_staff.library.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:name, :author, :library_id, :isbn, :issn, :age_limit, :count, :remain)
    end
end

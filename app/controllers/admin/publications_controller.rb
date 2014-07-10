class Admin::PublicationsController < AdminController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_library_to_params, only: :create

  # GET /publications
  def index
    obtain_the_publication_list
  end

  def show
  end

  # GET /publications/new
  def new
    add_publication
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
    update_publication_list
  end

  # PATCH/PUT /publications/1
  def update
    respond_to do |format|
      if @publication.update publication_params
        format.html { redirect_to admin_publication_path(@publication, type: params[:type]), notice: 'Publication was successfully updated.' }
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

  def update_publication_list
    @publication = params[:type].capitalize.constantize.new publication_params

    respond_to do |format|
      if @publication.save
        format.html { redirect_to admin_publication_path(@publication, type: params[:type]), notice: 'Publication was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def add_publication
    @publication = params[:type].capitalize.constantize.new
  end

  def obtain_the_publication_list
    @books     = Book.library current_library
    @magazines = Magazine.library current_library
  end

  def create_as_the_adding_date
    DateTime.now
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = params[:type].capitalize.constantize.find params[:id]
    end

    def set_library_to_params
      params[params[:type]][:library_id] = current_staff.library_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(params[:type]).permit(:library_id, :age_limit, :status, :author, :name, :count, :stock, :issn, :isbn, :interval)
    end


end

class Admin::MagazinesController < AdminController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]
  before_action :set_library_to_params, only: :create

  # GET /magazines/1
  def show
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end

  # GET /magazines/1/edit
  def edit
  end

  # POST /magazines
  def create
    @magazine = Magazine.new(magazine_params)

    respond_to do |format|
      if @magazine.save
        format.html { redirect_to [:admin, @magazine], notice: 'Publication was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /magazines/1
  def update
    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to [:admin, @magazine], notice: 'Publication was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /magazines/1
  def destroy
    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to admin_publications_url, notice: 'Magazine was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    def set_library_to_params
      params[:magazine][:library_id] = current_staff.try(:library_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:library_id, :age_limit, :status, :author, :name, :count, :remain, :issn, :interval)
    end
end

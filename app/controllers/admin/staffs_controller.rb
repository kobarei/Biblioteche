class Admin::StaffsController < AdminController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_non_subdomained_login_id, only: [:show, :edit]
  before_action :set_subdomained_login_id, only: [:create, :update, :destroy]
  before_action :set_library_to_params, only: :create

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        session[:staff_id] = @staff.id unless current_staff
        format.html { redirect_to [:admin, @staff], notice: 'Staff was successfully created.' }
      else
        set_non_subdomained_login_id
        format.html { render [:admin, :new] }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to [:admin, @staff], notice: 'Staff was successfully updated.' }
      else
        set_non_subdomained_login_id
        format.html { render [:admin, :edit] }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def set_non_subdomained_login_id
      @staff.login_id = non_subdomained_login_id(request, @staff.login_id)
    end

    def set_subdomained_login_id
      params[:staff][:login_id] = subdomained_login_id(request, params[:staff][:login_id])
    end

    def set_library_to_params
      params[:staff][:library_id] = current_staff.try(:library).try(:id) || current_library.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:name, :library_id, :login_id, :password, :passwrod_confirmation)
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_subdomained_login_id, only: [:create, :update]
  before_action :set_non_subdomained_login_id, only: [:show, :edit]
  before_action :set_library_to_params, only: [:create]

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id unless current_user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        set_non_subdomained_login_id
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        set_non_subdomained_login_id
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_non_subdomained_login_id
      @user.login_id = non_subdomained_login_id(request, @user.login_id)
    end

    def set_subdomained_login_id
      params[:user][:login_id] = subdomained_login_id(request, params[:user][:login_id])
    end

    def set_library_to_params
      params[:user][:library_id] ||= current_user.try(:library).try(:id) || current_library.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :library_id, :login_id, :age, :password, :password_confimation)
    end
end

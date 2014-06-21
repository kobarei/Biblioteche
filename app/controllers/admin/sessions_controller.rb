class Admin::SessionsController < AdminController
  before_action :subdomain_login_id, only: [:create]

  def new
  end

  def create
    staff = Staff.find_by login_id: params[:session][:login_id]
    if staff && staff.authenticate(params[:session][:password])
      session[:staff_id] = staff.id
      redirect_to [:admin, staff]
    else
      flash.now[:alert] = "Invalid"
      render "new"
    end
  end

  def destroy
    session[:staff_id] = nil
    redirect_to admin_root_path
  end

  def subdomain_login_id
    params[:session][:login_id] = subdomained_login_id(request, params[:session][:login_id])
  end
end

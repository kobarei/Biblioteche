class UserSessionsController < ApplicationController
  before_action :subdomain_login_id, only: [:create]

  def new
  end

  def create
    user = User.find_by login_id: params[:session][:login_id]
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = "Invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def subdomain_login_id
    params[:session][:login_id] = subdomained_login_id(request, params[:session][:login_id])
  end
end

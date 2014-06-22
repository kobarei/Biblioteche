class SessionsController < ApplicationController
  before_action :subdomain_login_id, only: :create
  before_action :go_to_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by login_id: params[:session][:login_id]
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      @user = User.new
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

  def go_to_user
    redirect_to user_path current_user if current_user
  end
end

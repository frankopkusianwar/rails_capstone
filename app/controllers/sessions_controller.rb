class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.username == params[:username]
      log_in @user
      redirect_to opinions_path
    elsif params[:username] && !@user
      flash[:alert] = "invalid username."
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end

class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.username == params[:username]
      session[:user_id] = @user.id 
      redirect_to feed_path
    else
      redirect_to root_path
    end
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params.require(:user).permit(:fullname, :username))
    @user.save
    session[:user_id] = @user.id
    redirect_to feed_path
  end
end

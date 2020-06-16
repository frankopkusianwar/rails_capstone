class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions
  end
  def create
    @user = User.new(params.require(:user).permit(:fullname, :username))
    if @user.save
      log_in @user
      redirect_to opinions_path
    else
      render 'users/new'
    end
  end
end

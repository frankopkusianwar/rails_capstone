class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.image.attach(params[:user][:image])
    if @user.update(user_params)
      flash[:success] = 'Your profile was edited.'
      redirect_to new_user_path
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions
    @users = User.all
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

  private
  def user_params
    params.require(:user).permit(:fullname, :username)
  end

  def user_params
    params.require(:user).permit(:content, :image)
  end
end

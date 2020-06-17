class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
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
    params.require(:user).permit(:fullname, :username, :image, :cover_image)
  end

  # def image_params
  #   params.require(:user).permit(:content, :image)
  # end

  # def cover_image_params
  #   params.require(:user).permit(:content, :cover_image)
  # end
end

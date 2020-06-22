class OpinionsController < ApplicationController
  def index
    @opinion = Opinion.new
    @opinions = Opinion.includes(:user).includes(:comments)
    @users = User.all
    @comment = Comment.new
  end

  def create
    opinion = Opinion.new(params.require(:opinion).permit(:Text))
    opinion.user_id = session[:user_id]
    opinion.save
    redirect_to opinions_path
  end
end

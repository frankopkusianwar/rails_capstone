class OpinionsController < ApplicationController
  def index
    @opinion = Opinion.new
    @opinions = Opinion.order(created_at: :desc).includes(:user)
    @users = User.order(created_at: :desc)
    @comment = Comment.new
  end

  def create
    opinion = Opinion.new(params.require(:opinion).permit(:Text))
    opinion.user_id = session[:user_id]
    opinion.save
    redirect_to opinions_path
  end
end

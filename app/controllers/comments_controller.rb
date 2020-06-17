class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    byebug
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to opinions_path
  end

  private

  def comment_params
    params.require(:comment).permit(:opinion_id, :content)
  end

end

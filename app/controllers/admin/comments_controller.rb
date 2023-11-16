class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    @store = @comment.store
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end

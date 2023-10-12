class Member::CommentController < ApplicationController

  def create
    store = Store.find(params[:store_id])
    comment = current_user.comments.new(comment_params)
    comment.store_id = store.id
    comment.save
    redirect_to member_stores_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end

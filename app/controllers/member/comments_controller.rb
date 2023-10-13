class Member::CommentsController < ApplicationController

  def create
       store = Store.find(params[:store_id])
    if comment = current_member.comments.new(comment_params)
       comment.store_id = store.id
       comment.save
      redirect_to member_store_path
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end

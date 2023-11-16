class Member::CommentsController < ApplicationController
  before_action :authenticate_member!, except: [:top, :guest_sign_in, :about]

  def create
    @member = current_member
    @store = Store.find(params[:store_id])
    @comment = @store.comments.build(comment_params)
    @comment.member = @member

    @comment.save
  end

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

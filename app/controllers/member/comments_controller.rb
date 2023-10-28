class Member::CommentsController < ApplicationController
  before_action :authenticate_member!, except: [:top, :guest_sign_in, :about]

  def create
  @member = current_member
  @store = Store.find(params[:store_id])
  @comment = @store.comments.build(comment_params)
  @comment.member = @member

   if @comment.save
    redirect_to store_path(@store)
   end

  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to store_path(params[:store_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end

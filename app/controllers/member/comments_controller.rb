class Member::CommentsController < ApplicationController

  def create
  @member = current_member
  @store = Store.find(params[:store_id])
  @comment = @store.comments.build(comment_params)
  @comment.member = @member

   if @comment.save
    redirect_to store_path(@store)
   else
    # エラーハンドリング
    render :new # エラーが発生した場合、フォームを再表示するか、適切な処理を行う
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

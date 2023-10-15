class Member::LikeListsController < ApplicationController

  
  def create
    store = Store.find(params[:store_id])
    like_list = current_member.like_lists.new(store_id: store.id)
    like_list.save
    redirect_to stores_path(store)
  end

  def destroy
    store = Store.find(params[:store_id])
    like_list = current_member.like_lists.find_by(store_id: store.id)
    like_list.destroy
    redirect_to stores_path(store)
  end

end

class Member::LikeListsController < ApplicationController
  before_action :authenticate_member!, except: [:top, :guest_sign_in, :about]


  def create
    @store = Store.find(params[:store_id])
    like_list = current_member.like_lists.new(store_id: @store.id)
    like_list.save
  end

  def destroy
    @store = Store.find(params[:store_id])
    like_list = current_member.like_lists.find_by(store_id: @store.id)
    like_list.destroy
  end

end

class Admin::StoresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @stores = Store.page(params[:page]).per(10)
    @category_parent_array = Category.category_parent_array_create
    @tag_list = Tag.all
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

     # 選択された子カテゴリに紐づく孫カテゴリを抽出する
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:children_id]).children
  end

  def show
    @store = Store.find(params[:id])
    @category_parent_array = Category.category_parent_array_create
    @tag_list = @store.tags.pluck(:name).join(',')
    @store_tags = @store.tags
  end


  def edit
    @store = Store.find(params[:id])
    @tag_list = @store.tags.pluck(:name).join(',')
    @store_tags = @store.tags
  end

  def update
    @store = Store.find(params[:id])
    tag_list=params[:store][:name].split(',')
    if @store.update(store_params)
      @store.save_tags(tag_list)
    redirect_to admin_store_path(@store)
    else
    render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @storedelete = Store.pluck(:store_id)
    @store.destroy
    redirect_to admin_stores_path
  end

  def search
      @stores = Store.looks(params[:parent_id], params[:children_id], params[:grandchildren_id], params[:shop]).page(params[:page]).per(10)
      @category_parent_array = Category.category_parent_array_create
      @tag_list = Tag.page(params[:page]).per(8)
  end

  def search_tag
    @category_parent_array = Category.category_parent_array_create
    #検索結果画面のタグ一覧表示
    @tag_list = Tag.page(params[:page]).per(8)
    #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    #検索に出たタグの投稿表示
    @stores = @tag.stores.page(params[:page]).per(10)
  end


  private

  def store_params
      params.require(:store).permit(:name, :nearest_station, :description, :image, :category_id, :parent_id, :children_id, :grandchildren_id, :shop)
  end

end

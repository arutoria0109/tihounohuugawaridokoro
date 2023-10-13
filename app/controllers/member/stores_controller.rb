class Member::StoresController < ApplicationController

  def new
      @store = Store.new
      @category_parent_array = Category.category_parent_array_create
  end

  def create
      @store = Store.new(store_params)
      if @store.save
        #maltilevel_category_createメソッドに引数を4つ渡して実行
        StoreCategory.maltilevel_category_create(
          @store,
         params[:parent_id],
          params[:children_id],
          params[:grandchildren_id]
          )
        redirect_to member_store_path(@store)
      else
        @stores = Store.all
        #category_parent_array_createメソッドの戻り値として受け取った配列をインスタンス変数に代入
        @category_parent_array = Category.category_parent_array_create
        render :new
      end
  end

  def index

      @stores = Store.all
      @category_parent_array = Category.category_parent_array_create
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
      @comment = Comment.new
      @member = current_member
      @category_parent_array = Category.category_parent_array_create
  end

  def edit
      @store = Store.find(params[:id])
  end

  def update
      @store = Store.find(params[:id])
      if @store.update(store_params)
      redirect_to member_store_path(@store)
      else
      render :edit
      end
  end

  private

  def store_params
      params.require(:store).permit(:name, :nearest_station, :description, :image, :category_id)
  end

end

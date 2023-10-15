class Member::StoresController < ApplicationController

  def new
      @store = Store.new
      @category_parent_array = Category.category_parent_array_create
  end

  def create
      @member = current_member
      @store = @member.stores.build(store_params)
      #@store = Store.new(store_params)
      if @store.save
        #maltilevel_category_createメソッドに引数を4つ渡して実行
        StoreCategory.maltilevel_category_create(
          @store,
         params[:parent_id],
          params[:children_id],
           params[:grandchildren_id]
          )
        redirect_to store_path(@store)
      else
        flash[:error] = @store.errors.full_messages.join(', ')
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
      redirect_to store_path(@store)
      else
      render :edit
      end
  end

  def destroy
     @store = Store.find(params[:id])
     @store.destroy
    redirect_to stores_path
  end













  def store_search
    # カテゴリ名を取得するために@categoryにレコードをとってくる
    @category = Category.find_by(id: params[:id])
    # 親カテゴリーを選択していた場合の処理
    if @category.ancestry == nil
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      category = Category.find_by(id: params[:id]).indirect_ids
      # 孫カテゴリーに該当するstoresテーブルのレコードを入れるようの配列を用意
      @stores = []
      # find_storeメソッドで処理
      find_store(category)

    # 孫カテゴリーを選択していた場合の処理
    elsif @category.ancestry.include?("/")
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      @stores = Store.where(category_id: params[:id])

    # 子カテゴリーを選択していた場合の処理
    else
      category = Category.find_by(id: params[:id]).child_ids
      # 孫カテゴリーに該当するstoresテーブルのレコードを入れるようの配列を用意
      @stores = []
      # find_storeメソッドで処理
      find_store(category)
    end
  end

  def find_store(category)
    category.each do |id|
      store_array = Store.includes(:images).where(category_id: id)
      # find_by()メソッドで該当のレコードがなかった場合、storeオブジェクトに空の配列を入れないようにするための処理
      if store_array.present?
        store_array.each do |store|
          if store.present?
          else
            # find_by()メソッドで該当のレコードが見つかった場合、@store配列オブジェクトにそのレコードを追加する
            @stores.push(store)
          end
        end
      end
    end
  end
















  private

  def store_params
      params.require(:store).permit(:name, :nearest_station, :description, :image, :category_id)
  end

end

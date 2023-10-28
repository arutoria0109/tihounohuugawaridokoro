class Member::StoresController < ApplicationController
  before_action :authenticate_member!, except: [:top, :guest_sign_in, :about]
  before_action :is_matching_login_member, only: [:edit, :update]

  def new
    @store = Store.new
    @category_parent_array = Category.category_parent_array_create
    @member = current_member
  end

  def create
    @member = current_member
    @store = @member.stores.build(store_params)
    tag_list = params[:store][:name].split(',')
    if @store.save
    #maltilevel_category_createメソッドに引数を4つ渡して実行
    StoreCategory.maltilevel_category_create(
      @store,
        params[:parent_id],
         params[:children_id],
          params[:grandchildren_id]
          )
    @store.save_tags(tag_list)
    redirect_to store_path(@store), notice:"投稿完了！"
    else
    flash[:error] = @store.errors.full_messages.join(', ')
    @stores = Store.all
    #category_parent_array_createメソッドの戻り値として受け取った配列をインスタンス変数に代入
    @category_parent_array = Category.category_parent_array_create
    render :new
    end
  end

  def index
    likelist_store_ids = LikeList.pluck(:store_id)  #いいねされた投稿のidを取得
    all_store_ids = Store.ids   #投稿のidのみを取得する
    #いいねがある投稿だけを降順で並び替える('count(store_id) desc')まで・←store_idに代入・+すべての投稿idからいいねされている投稿を引いた投稿を足す
    @all_ranks = Kaminari.paginate_array(Store.find(LikeList.group(:store_id).order('count(store_id) desc').pluck(:store_id) + (all_store_ids - likelist_store_ids))).page(params[:page]).per(10)
    @category_parent_array = Category.category_parent_array_create
    @tag_list = Tag.page(params[:page]).per(12)
    @member = current_member
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
    @tag_list = @store.tags.pluck(:name).join(',')
    @store_tags = @store.tags
  end

  def like
    #ユーザがいいねした投稿を取得↓
    @liked_stores = current_member.liked_stores.page(params[:page]).per(10)
    @category_parent_array = Category.category_parent_array_create
    @member = current_member
  end


  def edit
    @store = Store.find(params[:id])
    @tag_list = @store.tags.pluck(:name).join(',')
  end

  def update
    @store = Store.find(params[:id])
    tag_list=params[:store][:name].split(',')
    if @store.update(store_params)
      @store.save_tags(tag_list)
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

  def is_matching_login_member
    @store = Store.find(params[:id])
    unless current_member.id == @store.member_id
      redirect_to stores_path
    end
  end

end


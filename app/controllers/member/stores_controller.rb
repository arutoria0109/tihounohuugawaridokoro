class Member::StoresController < ApplicationController

  def new
      @store = Store.new
  end

  def create
      @store = Store.new(store_params)
      if @store.save
        redirect_to member_store_path(@store)
      else
        render :new
      end
  end

  def index
      @stores = Store.all
  end

  def show
      @store = Store.find(params[:id])
  end

  def edit
      @store = Store.find(params[:id])
  end

  def update
      @store = Store.find(params[:id])
      if @store.save(store_params)
      redirect_to member_store_path(@store)
      else
      render :edit
      end
  end

  private

  def store_params
      params.require(:store).permit(:name, :prefecture, :nearest_station, :description, :category_id, :image)
  end

end

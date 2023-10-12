class StoreCategory < ApplicationRecord

  belongs_to :category
  belongs_to :store
  
  #controllerから引数を４つ受け取る(作成するデータ、親カテゴリID、子カテゴリID、孫カテゴリID)
  def self.maltilevel_category_create(store, parent_id, children_id, grandchildren_id)
    #親カテゴリのIDを引数として受け取れた場合かつ、初期値でない場合処理
    if parent_id.present? && parent_id != '---'
      #categoryモデルから引数で受け取った親カテゴリIDに対応するレコード抽出し、変数に代入する。
      category = Category.find(parent_id)
      #StoreCategory(中間テーブル)にレコードを作成する。
      StoreCategory.create(store_id: store.id, category_id: category.id)
    end
    
    if children_id.present? && children_id != '---'
      category = Category.find(children_id)
      StoreCategory.create(store_id: store.id, category_id: category.id)
    end
    
    if grandchildren_id.present? && grandchildren_id != '---'
      category = Category.find(grandchildren_id)
      StoreCategory.create(store_id: store.id, category_id: category.id)
    end
  end
  
end

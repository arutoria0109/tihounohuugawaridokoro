class Category < ApplicationRecord

  has_many :stores, dependent: :destroy
  has_many :store_categories
  has_ancestry

  def self.category_parent_array_create
    #{1}親カテゴリのセレクトボックス作成するための配列を用意し、初期値の格納
    category_parent_array = ['---']
    #{2}親カテゴリを全て抽出し、{１}で作った配列にカテゴリ名とIDを格納する
    Category.where(ancestry: nil).each do |parent|
      category_parent_array << [parent.name, parent.id]
    end
    #{1}で作成した配列を戻り値に設定
    return category_parent_array
  end

end

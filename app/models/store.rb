class Store < ApplicationRecord

  belongs_to :member
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :store_categories
  has_many :like_lists, dependent: :destroy
  has_many :liking_members, through: :like_lists, source: :member
  belongs_to :parent, class_name: "Category"
  belongs_to :grandchildren, class_name: "Category"
  belongs_to :children, class_name: "Category"
  #多対多の関係性を持ついいねのモデルと投稿のモデルを使用する↑
  has_one_attached :image


  # 検索方法分岐 (nameは検索対象であるstoresテーブル内のカラム名)
  def self.looks(parent, children, grandchildren, name)
    if parent != "-" && children != "---" && grandchildren != "---"
      @store = Store.where(parent_id: parent, children_id: children,grandchildren_id: grandchildren)
    else
      if name!= ""
      @stores = Store.where(name: name)
      else
      @stores = Store.all
      end
    end
  end

  def like_listed_by?(member)#ユーザidがFavoritesテーブル内に存在（exists?）するか
    like_lists.exists?(member_id: member.id)
  end

  def get_image(x,y)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [x, y]).processed

  end

end

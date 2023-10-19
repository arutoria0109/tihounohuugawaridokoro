class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stores, dependent: :destroy
  has_many :like_lists, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :liked_stores, through: :like_lists, source: :store
  #多対多の関係性を持ついいねのモデルと投稿のモデルを使用する↑
  
  def active_for_authentication?
  super && (is_valid == true)
  end

end

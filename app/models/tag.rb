class Tag < ApplicationRecord
  has_many :store_tags, dependent: :destroy
  has_many :stores, through: :store_tags
  #↑2つのモデル間の関連がstore_tagsモデルを通じて行われる

end

class LikeList < ApplicationRecord

  belongs_to :store
  belongs_to :member

  validates :member_id, uniqueness: {scope: :store_id}

end

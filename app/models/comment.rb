class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :store

  validates :comment, presence: true

end

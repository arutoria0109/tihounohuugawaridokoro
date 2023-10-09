class Category < ApplicationRecord
  
  has_many :stores, dependent: :destroy
  has_ancestry
end

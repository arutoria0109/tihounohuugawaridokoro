class Store < ApplicationRecord

  belongs_to :member
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :store_categories
  has_one_attached :image


 def get_image(x,y)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [x, y]).processed

 end

end

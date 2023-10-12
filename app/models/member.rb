class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :stores, dependent: :destroy
has_many :like_lists, dependent: :destroy
has_many :comments, dependent: :destroy


end

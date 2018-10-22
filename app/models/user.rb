class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name ,uniqueness: true
  validates :name ,length: {maximum: 36}
  validates :name ,presence: true
  validates :description , length: {maximum: 140}

  #　画像投稿

  attachment :user_image
  attachment :header_image
end

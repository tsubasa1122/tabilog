class Trip < ApplicationRecord
  geocoded_by :place
  after_validation :geocode

  # 画像投稿
  attachment :photo

  #アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :wannagos, dependent: :destroy
  belongs_to :category
end

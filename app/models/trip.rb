class Trip < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  # バリデーション
  validates :place_detail,  length: {maximum: 300}



  #アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :wannagos, dependent: :destroy
  has_many :trip_photos, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :trip_photos
  # 画像投稿
  accepts_attachments_for :trip_photos, attachment: :trip_image

  # 行きたいボタンを押しているかどうか
  def wannagoed_by?(user)
    wannagos.where(user_id: user.id).exists?
  end
end

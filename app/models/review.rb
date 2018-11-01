class Review < ApplicationRecord
  belongs_to :evaluation
  belongs_to :evaluation_image
  belongs_to :user
  belongs_to :trip
  has_many :favorites, dependent: :destroy
  has_many :review_photos, dependent: :destroy
  accepts_nested_attributes_for :review_photos
  accepts_attachments_for :review_photos, attachment: :review_image
  # 画像投稿

  #　お気に入りしているかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end

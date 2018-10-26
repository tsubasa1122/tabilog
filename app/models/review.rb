class Review < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  belongs_to :trip
  has_many :favorites, dependent: :destroy
  has_many :review_photos, dependent: :destroy
  accepts_nested_attributes_for :review_photos
  accepts_attachments_for :review_photos, attachment: :review_image
end

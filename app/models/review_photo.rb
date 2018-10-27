class ReviewPhoto < ApplicationRecord
  belongs_to :review, optional: true
  attachment :review_image
end

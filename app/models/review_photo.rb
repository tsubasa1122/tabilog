class ReviewPhoto < ApplicationRecord
  belongs_to :review
  attachment :review_image
end

class Review < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  belongs_to :trip
  has_many :favorite, dependent: :destroy
end

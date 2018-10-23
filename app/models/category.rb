class Category < ApplicationRecord
  has_many :trips, dependent: :destroy
end

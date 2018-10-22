class Trip < ApplicationRecord
  geocoded_by :place
  after_validation :geocode

  # 画像投稿
  attachment :photo
end

class Trip < ApplicationRecord
  geocoded_by :place
  after_validation :geocode
end

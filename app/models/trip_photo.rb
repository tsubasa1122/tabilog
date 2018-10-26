class TripPhoto < ApplicationRecord
  belongs_to :trip, optional: true
  attachment :trip_image

end

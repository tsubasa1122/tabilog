module SearchTrip
  extend ActiveSupport::Concern


  included do
    scope :search_title, lambda { |keyword|
      where("(trips.place_name LIKE :keyword) OR (trips.address LIKE :keyword )", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
    }
    scope :search, lambda { |s|
      r = self
      r = r.search_title(s[:s_title]) if s[:s_title].present?
      return r if r != self
      where({})
    }
  end
end


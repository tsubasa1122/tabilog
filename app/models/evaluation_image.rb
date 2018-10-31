class EvaluationImage < ApplicationRecord
  has_many :reviews
  attachment :image
end

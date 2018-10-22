class ApplicationRecord < ActiveRecord::Base
  acts_as_paranoid  #追加 論理削除（gem:paranoid）
  self.abstract_class = true
end

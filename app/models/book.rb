class Book < ApplicationRecord
  has_many :titles
  has_many :articles
end

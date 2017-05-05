class Chapter < ApplicationRecord
  belongs_to :title
  has_many :sections
  has_many :articles
end

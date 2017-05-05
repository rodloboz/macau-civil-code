class Section < ApplicationRecord
  belongs_to :chapter
  has_many :division
  has_many :subsections
  has_many :articles
end

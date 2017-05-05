class Title < ApplicationRecord
  belongs_to :book
  has_many :subtitles
  has_many :chapters
  has_many :articles
end

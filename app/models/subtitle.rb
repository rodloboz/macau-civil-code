class Subtitle < ApplicationRecord
  belongs_to :title
  has_many :articles
end

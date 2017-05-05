class Subdivision < ApplicationRecord
  belongs_to :division
  has_many :articles
end

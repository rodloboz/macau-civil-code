class Division < ApplicationRecord
  belongs_to :section
  has_many :subdivisions
  has_many :articles
end

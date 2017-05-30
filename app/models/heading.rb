class Heading < ApplicationRecord
  has_many :translations

  validates :pt, presence: true
end

class Book < ApplicationRecord
  has_many :titles
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

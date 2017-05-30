class Section < ApplicationRecord
  belongs_to :chapter
  has_many :division
  has_many :subsections
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

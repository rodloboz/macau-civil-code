class Subtitle < ApplicationRecord
  belongs_to :title
  has_many :articles
  has_many :chapters
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

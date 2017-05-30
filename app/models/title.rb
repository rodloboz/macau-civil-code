class Title < ApplicationRecord
  belongs_to :book
  has_many :subtitles
  has_many :chapters
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

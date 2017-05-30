class Chapter < ApplicationRecord
  belongs_to :title
  belongs_to :subtitle, optional: true
  has_many :sections
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

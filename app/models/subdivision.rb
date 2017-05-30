class Subdivision < ApplicationRecord
  belongs_to :division
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

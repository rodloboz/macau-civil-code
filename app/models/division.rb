class Division < ApplicationRecord
  belongs_to :subsection
  has_many :subdivisions
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end

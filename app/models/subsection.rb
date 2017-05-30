class Subsection < ApplicationRecord
  belongs_to :section
  has_many :articles
  has_one :heading

  validates_presence_of :heading
  validates :number, presence: true
end


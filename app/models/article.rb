class Article < ApplicationRecord
  belongs_to :book
  belongs_to :title
  belongs_to :subtitle
  belongs_to :chapter
  belongs_to :section
  belongs_to :subsection
  belongs_to :division
  belongs_to :subdivision
  has_many :translations

  validates :number, :pt, presence: true
end

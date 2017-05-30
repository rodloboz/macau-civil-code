class Article < ApplicationRecord
  belongs_to :book
  belongs_to :title
  belongs_to :subtitle, optional: true
  belongs_to :chapter, optional: true
  belongs_to :section, optional: true
  belongs_to :subsection, optional: true
  belongs_to :division, optional: true
  belongs_to :subdivision, optional: true
  has_many :translations
  has_one :heading

  validates_presence_of :heading
  validates :number, :pt, presence: true
end

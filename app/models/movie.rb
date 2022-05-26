class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, presence: true
  validates :overview, presence: true
  validates :title, uniqueness: { case_senitive: false }
  validates :overview, uniqueness: { case_senitive: false }
end

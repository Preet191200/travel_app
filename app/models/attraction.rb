class Attraction < ApplicationRecord
  belongs_to :city
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
end
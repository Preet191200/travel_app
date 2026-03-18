class Country < ApplicationRecord
  has_many :cities
  validates :name, presence: true, uniqueness: true
  validates :region, presence: true
  validates :population, presence: true, numericality: { greater_than: 0 }
end
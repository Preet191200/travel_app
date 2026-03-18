class City < ApplicationRecord
  belongs_to :country
  has_many :attractions
  validates :name, presence: true
  validates :country, presence: true
end
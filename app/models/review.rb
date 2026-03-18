class Review < ApplicationRecord
  belongs_to :attraction
  validates :rating, presence: true
  validates :comment, presence: true
end
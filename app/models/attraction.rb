class Attraction < ApplicationRecord
 
  belongs_to :city
has_many :reviews
  validates :name, presence: true
  
end

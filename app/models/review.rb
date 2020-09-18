class Review < ApplicationRecord
  belongs_to :restaurant

  validates_associated :restaurant
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: (0..5).to_a }
  validates :rating, numericality: { only_integer: true }
end

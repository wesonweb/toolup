class Tool < ApplicationRecord
  NAMES = ["Circular saw", "Jigsaw", "Drill", "Clamp", "Lawnmower", "Leaf blower", "Sander"]
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :price, :postcode, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, inclusion: { in: NAMES }
end

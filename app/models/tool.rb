class Tool < ApplicationRecord
  TYPES = ["Hammer", "Saw", "Axe", "Drill", "Clamp"]

  belongs_to :user
  has_many :booking

  validates :price, :location, description, presence: true
  validates :price, numericality: { only_integer: true }
  validates :type, inclusion: { in: TYPES }
end

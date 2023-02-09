class Tool < ApplicationRecord
  NAMES = ["Hammer", "Circular saw", "Axe", "Drill", "Clamp"]

  belongs_to :user
  has_many :booking

  validates :price, :postcode, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, inclusion: { in: NAMES }
end

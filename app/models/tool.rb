class Tool < ApplicationRecord
  TYPES = ["Hammer", "Circular saw", "Axe", "Drill", "Clamp"]

  belongs_to :user
  has_many :booking

  validates :price, :postcode, presence: true
  validates :price, numericality: { only_integer: true }
  validates :type, inclusion: { in: TYPES }
end

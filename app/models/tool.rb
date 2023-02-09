class Tool < ApplicationRecord
  TYPES = ["Hammer", "Circular saw", "Axe", "Drill", "Clamp"]

  belongs_to :user
  has_many :review, through: :booking, dependnt: :destroy
  validates :price, :postcode, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, inclusion: { in: TYPES }
end

class Tool < ApplicationRecord
  NAMES = ["Circular saw", "Jigsaw", "Drill", "Clamp", "Lawnmower", "Leaf blower", "Sander"]

  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_many :review, through: :booking, dependnt: :destroy
  validates :price, :address, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, inclusion: { in: NAMES }
end

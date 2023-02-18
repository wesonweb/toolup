class Tool < ApplicationRecord
  NAMES = ["Circular saw", "Jigsaw", "Drill", "Clamp", "Lawnmower", "Leaf blower", "Sander"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  has_one_attached :photo
  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?

  validates :price, :address, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, inclusion: { in: NAMES }
end

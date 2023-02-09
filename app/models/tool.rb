class Tool < ApplicationRecord
  TYPES = ["Electrical", "Sewing & Cutting", "Woodworking", "Measuring", "Plumbing"]

  belongs_to :user
  has_many :booking

  validates :price, :location, description, presence: true
  validates :price, numericality: { only_integer: true }
  validates :type, inclusion: { in: TYPES }
end

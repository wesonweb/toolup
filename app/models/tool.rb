class Tool < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :bookings
end

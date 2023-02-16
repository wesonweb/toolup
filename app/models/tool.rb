class Tool < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true}

    }


  NAMES = ["Circular saw", "Jigsaw", "Drill", "Clamp", "Lawnmower", "Leaf blower", "Sander"]

  belongs_to :user
  # has_many :review, through: :booking, dependnt: :destroy
  validates :price, :postcode, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, inclusion: { in: NAMES }
end

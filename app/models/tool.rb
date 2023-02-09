class Tool < ApplicationRecord
  belongs_to :user_id
  has_many :tools, dependent: :destroy
end

class Restaurant < ApplicationRecord
  # When a restaurant is destroyed, all of its reviews must be destroyed as well.
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian),
    message: "%{value} is not a valid cusine" }
end


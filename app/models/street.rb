class Street < ApplicationRecord
  has_many :communes

  validates :title, presence: true
  validates :from, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :to, numericality: { only_integer: true, greater_than_or_equal_to: :from }, allow_nil: true
end

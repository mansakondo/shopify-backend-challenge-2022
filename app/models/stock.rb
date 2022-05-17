class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :location

  attribute :quantity, :integer, default: 0

  validates :quantity,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

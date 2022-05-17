class Inventory < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :locations

  validates :name, presence: true
end

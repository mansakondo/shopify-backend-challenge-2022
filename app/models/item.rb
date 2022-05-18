class Item < ApplicationRecord
  belongs_to :inventory

  has_many :stocks, dependent: :destroy

  accepts_nested_attributes_for :stocks

  validates :name, presence: true
  validates_associated :stocks
end

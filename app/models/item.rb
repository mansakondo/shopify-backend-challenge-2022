class Item < ApplicationRecord
  belongs_to :inventory

  has_many :stocks, dependent: :destroy

  validates :name, presence: true
  validates_associated :stocks
end

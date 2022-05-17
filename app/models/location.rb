class Location < ApplicationRecord
  belongs_to :inventory

  has_many :stocks, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
end

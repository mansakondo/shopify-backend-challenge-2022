class Location < ApplicationRecord
  belongs_to :inventory

  has_many :stocks, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true

  after_create :create_empty_stocks

  def create_empty_stocks
    inventory.items.each do |item|
      item.stocks.create!(location: self)
    end
  end
end

class StocksController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventory_id])

    if params[:location_id]
      @stocks           = Stock.where(location_id: params[:location_id])
      @default_location = Location.find(params[:location_id])
    else
      @default_location = @inventory.locations.first
      @stocks           = Stock.where(location: @default_location)
    end
  end
end

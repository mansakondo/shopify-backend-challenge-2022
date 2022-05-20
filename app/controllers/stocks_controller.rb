class StocksController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventory_id])

    if params[:location_id]
      @stocks   = Stock.where(location_id: params[:location_id])
      @location = @inventory.locations.find(params[:location_id])
    else
      @base_location = @inventory.base_location
      @stocks        = Stock.where(location: @base_location)
    end
  end
end

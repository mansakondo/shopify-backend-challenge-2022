class LocationsController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventory_id])
    @locations = @inventory.locations
  end

  def show
    @inventory = Inventory.find(params[:inventory_id])
    @location  = Location.find(params[:id])
  end

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @location  = @inventory.locations.build
  end

  def edit
    @inventory = Inventory.find(params[:inventory_id])
    @location  = Location.find(params[:id])
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @location  = @inventory.locations.build(location_params)

    if @location.save
      redirect_to inventory_locations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @inventory = Inventory.find(params[:inventory_id])
    @location  = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to inventory_location_path(@inventory, @location)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    redirect_to inventory_locations_path
  end

  private

    def location_params
      params.require(:location).permit(:id, :name, :address, :city, :country)
    end
end

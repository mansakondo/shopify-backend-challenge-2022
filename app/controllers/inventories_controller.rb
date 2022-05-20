class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new

    @inventory.build_base_location
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      redirect_to inventories_path
    else
      render :new
    end
  end

  def update
    @inventory = Inventory.find(params[:id])

    unless params[:inventory][:base_location_id] == @inventory.base_location.id
      new_base_location = @inventory.locations.find(params[:inventory][:base_location_id])

      @inventory.change_base_location_to new_base_location
    end

    if @inventory.update(inventory_params)
      redirect_to inventories_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @inventory = Inventory.find(params[:id])

    @inventory.destroy

    redirect_to inventories_path, status: :see_other
  end

  private
    def inventory_params
      params.require(:inventory).permit(:id, :name, base_location_attributes: [:id, :name, :address, :city, :country])
    end
end

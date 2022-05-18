class ItemsController < ApplicationController
  def show
    @item      = Item.find(params[:id])
    @inventory = Inventory.find(params[:inventory_id])
  end

  def new
    @item      = Item.new
    @inventory = Inventory.find(params[:inventory_id])

    @inventory.locations.each do |location|
      @item.stocks.build(location: location)
    end
  end

  def edit
    @item      = Item.find(params[:id])
    @inventory = @item.inventory
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @item      = @inventory.items.build(item_params)

    if @item.save
      redirect_to inventory_stocks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @item      = Item.find(params[:id])
    @inventory = @item.inventory

    if @item.update(item_params)
      redirect_to inventory_item_path(@inventory, @item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to inventory_stocks_path
  end

  private
    def item_params
      params.require(:item).permit(:id, :name, stocks_attributes: [:id, :quantity, :location_id])
    end
end

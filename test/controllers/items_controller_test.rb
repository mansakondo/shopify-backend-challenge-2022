require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = Inventory.first
    @item      = @inventory.items.first
  end

  test "should get show" do
    get inventory_item_url(@inventory, @item)
    assert_response :success
  end

  test "should get new" do
    get new_inventory_item_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_item_url(@inventory, @item)
    assert_response :success
  end
end

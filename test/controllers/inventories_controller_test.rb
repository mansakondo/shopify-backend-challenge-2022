require "test_helper"

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(Inventory.first)
    assert_response :success
  end
end

require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = Inventory.first
    @location  = @inventory.locations.first
  end

  test "should get index" do
    get inventory_locations_url(@inventory)
    assert_response :success
  end

  test "should get show" do
    get inventory_location_url(@inventory, @location)
    assert_response :success
  end

  test "should get new" do
    get new_inventory_location_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_location_url(@inventory, @location)
    assert_response :success
  end
end

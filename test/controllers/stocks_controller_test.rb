require "test_helper"

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inventory_stocks_url(Inventory.first)
    assert_response :success
  end
end

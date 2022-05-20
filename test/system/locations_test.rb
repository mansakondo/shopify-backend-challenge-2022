require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  test "should create locations with empty stocks" do
    visit inventories_url

    pause

    within("#inventory_#{Inventory.first.id}") do
      click_on "Manage locations"
    end

    pause

    click_button "add"

    fill_in "Name", with: "Some warehouse"
    fill_in "Address", with: Faker::Address.street_address
    fill_in "City", with: Faker::Address.city
    fill_in "Country", with: Faker::Address.country

    pause

    click_on "Create Location"

    pause

    click_link "home"

    pause

    click_on "Sample inventory"

    pause

    find(:xpath, ".//label[@for='toggle-locations']").click

    pause

    click_on "Some warehouse"

    pause

    assert_text "0"
  end
end

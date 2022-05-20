require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  test "should create inventories with a base location" do
    visit inventories_url

    pause

    click_button "add"

    fill_in "Name", with: "Some inventory", id: "inventory_name"

    within_fieldset("Base location") do
      fill_in "Name", with: "Some warehouse"
      fill_in "Address", with: Faker::Address.street_address
      fill_in "City", with: Faker::Address.city
      fill_in "Country", with: Faker::Address.country
    end

    pause

    click_on "Create Inventory"

    within("#inventory_#{Inventory.last.id}") do
      click_on "Manage locations"
    end

    pause

    assert_text "Some warehouse"
  end

  test "should be able to change the base location" do
    visit inventories_url

    pause

    within("#inventory_#{Inventory.first.id}") do
      click_on "Edit"
    end

    pause

    select "Warehouse 2", from: "Base location"

    pause

    click_on "Update Inventory"

    pause

    click_on "Sample inventory"

    pause

    assert_text "Warehouse 2"
  end
end

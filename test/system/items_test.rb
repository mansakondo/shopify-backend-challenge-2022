require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  test "should create items with stocks" do
    visit inventories_url

    pause

    click_on "Sample inventory"

    pause

    click_button "add"

    pause

    fill_in "Name", with: "Some item"

    pause

    within_fieldset("Stocks") do
      6.times do |i|
        fill_in "item_stocks_attributes_#{i}_quantity", with: "#{i + 1}"
      end
    end

    pause

    click_on "Create Item"

    pause

    click_on "Some item"

    pause

    within("tbody") do
      all("tr").each_with_index do |tr, i|
        within(tr) do
          within("td[headers='quantity']") do
            assert_text "#{i + 1}"
          end
        end
      end
    end
  end

  test "should be able to update stocks" do
    visit inventories_url

    pause

    click_on "Sample inventory"

    pause

    click_button "add"

    pause

    fill_in "Name", with: "Some item"

    pause

    within_fieldset("Stocks") do
      6.times do |i|
        fill_in "item_stocks_attributes_#{i}_quantity", with: "#{i + 1}"
      end
    end

    pause

    click_on "Create Item"

    pause

    click_on "Some item"

    pause

    click_on "Edit"

    pause

    within_fieldset("Stocks") do
      6.times do |i|
        fill_in "item_stocks_attributes_#{i}_quantity", with: "#{i + 2}"
      end
    end

    pause

    click_on "Update Item"

    pause

    within("tbody") do
      all("tr").each_with_index do |tr, i|
        within(tr) do
          within("td[headers='quantity']") do
            assert_text "#{i + 2}"
          end
        end
      end
    end
  end
end

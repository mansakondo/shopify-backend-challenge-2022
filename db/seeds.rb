inventory = Inventory.create(name: "Sample inventory")

6.times do |i|
  location = Location.new

  location.name    = "Warehouse #{i+1}"
  location.address = Faker::Address.street_address
  location.city    = Faker::Address.city
  location.country = Faker::Address.country

  inventory.locations << location
end

6.times do
  item = Item.create(name: Faker::Commerce.unique.product_name, inventory: inventory)

  inventory.locations.each do |location|
    stock = Stock.create(item: item, quantity: rand(10), location: location)
  end
end

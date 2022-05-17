inventory = Inventory.create(name: "Sample inventory")

6.times do |i|
  location = Location.new

  location.name    = "Warehouse #{i}"
  location.address = Faker::Address.street_address
  location.city    = Faker::Address.city
  location.country = Faker::Address.country

  inventory.locations << location
end

6.times do
  item = Item.create(name: Faker::Commerce.unique.product_name, inventory: inventory)

  6.times do
    stock = Stock.create(item: item, quantity: rand(10), location: inventory.locations.to_a.sample)
  end
end

base_location = Location.new(
  name: "Warehouse 1",
  address: Faker::Address.street_address,
  city: Faker::Address.city,
  country: Faker::Address.country,
  base: true
)

inventory = Inventory.create(name: "Sample inventory", base_location: base_location)

2.upto(6) do |n|
  location = Location.new

  location.name    = "Warehouse #{n}"
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

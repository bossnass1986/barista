puts 'Did you hear that? They shut down the main reactor.'

puts 'Deleting All Users'
User.delete_all
puts 'Creating Control Users'
User.create!(id:1, first_name: 'Paul', last_name: 'McGuane', mobile: '0430091465', email: 'admin@bng.com.au', password: 'paul1234').add_role(:platform_admin)
# User.create!(id:2, first_name: 'Supplier Admin', mobile: '0430091461', email: 'supplier_admin@bng.com.au').add_role(:supplier_admin)
# User.create!(id:3, first_name: 'Shopper', mobile: '0430091462', email: 'shopper@bng.com.au').add_role(:shopper)
# User.create!(id:4, first_name: 'Supplier Staff', mobile: '0430091460', email: 'supplier_staff@bng.com.au').add_role(:supplier_staff)

puts 'Deleting All Countries'
Country.delete_all
puts 'They are now conducting an extensive search of the surrounding systems.'
file_to_load  = Rails.root + 'db/seed/countries.yml'
countries_list   = YAML::load( File.open( file_to_load ) )

countries_list.each_pair do |key,country|
  s = Country.find_by(abbreviation: country['abbreviation'])
  unless s
    c = Country.create(country) unless s
    c.update_attribute(:active, true) if Country::ACTIVE_COUNTRY_IDS.include?(c.id)
  end
end

puts 'Deleting All States/Provinces/Territories'
State.delete_all
puts 'The regional governors now have direct control over their territories. '
file_to_load  = Rails.root + 'db/seed/states.yml'
states_list   = YAML::load( File.open( file_to_load ) )

states_list.each_pair do |key,state|
  s = State.find_by(abbreviation: state['attributes']['abbreviation'], country_id: state['attributes']['country_id'])
  State.create(state['attributes']) unless s
end

puts 'Deleting Product Types'
ProductType.delete_all
puts 'Creating Standard Product Types'
ProductType.create!([
  {id: 1, name: 'Hot'},
  {id: 2, name: 'Cold '}
])

puts 'Deleting All Menu Items'
Product.delete_all
puts 'Creating Standard Menu Items'
Product.create!([
  {id: 1, product_type_id: 2, name: 'Bubble Tea', description: 'A normal, regular milk cappuccino', shipping_category_id: 1},
  {id: 2, product_type_id: 1, name: 'Cappuccino', description: 'Silky frothed milk poured over a shot of espresso, topped with a touch of chocolate.', shipping_category_id: 1},
  {id: 3, product_type_id: 1, name: 'Chai Latte', description: 'A normal, regular milk latte', shipping_category_id: 1},
  {id: 4, product_type_id: 1, name: 'Flat White', description: 'Steamed milk with small, fine bubbles and a glossy or velvety consistency poured over a shot of espresso.', shipping_category_id: 1},
  {id: 5, product_type_id: 1, name: 'Frappe', description: 'A normal, regular milk macchiato', shipping_category_id: 1},
  {id: 6, product_type_id: 1, name: 'Hot Chocolate', description: 'Silky steamed milk poured over melted chocolate topped with chocolate powder', shipping_category_id: 1},
  {id: 7, product_type_id: 2, name: 'Iced Chocolate', description: 'A normal, regular milk coffee', shipping_category_id: 1},
  {id: 8, product_type_id: 2, name: 'Iced Coffee', description: 'A normal, regular milk latte', shipping_category_id: 1},
  {id: 9, product_type_id: 2, name: 'Iced Tea', description: 'A normal, regular milk macchiato', shipping_category_id: 1},
  {id: 10, product_type_id: 1, name: 'Irish', description: 'A normal, regular milk macchiato', shipping_category_id: 1},
  {id: 11, product_type_id: 1, name: 'Latte', description: 'A drink made by adding perfectly steamed milk to a shot of espresso served in a glass.', shipping_category_id: 1},
  {id: 12, product_type_id: 1, name: 'Latte Macchiato', description: 'A normal, regular milk coffee', shipping_category_id: 1},
  {id: 13, product_type_id: 1, name: 'Long Black', description: 'A long black is made by pouring a double-shot of espresso or ristretto over hot water.', shipping_category_id: 1},
  {id: 14, product_type_id: 1, name: 'Macchiato', description: 'A single shot of espresso with a small amount of steamed milk.', shipping_category_id: 1},
  {id: 15, product_type_id: 1, name: 'Mocha', description: 'Mocha, in its most basic formulation, can also be referred to as hot chocolate with a shot of espresso added to it.', shipping_category_id: 1},
  {id: 16, product_type_id: 1, name: 'Short Black', description: 'A single shot of espresso.', shipping_category_id: 1},
  {id: 17, product_type_id: 1, name: 'Tea', description: 'A normal, regular milk coffee', shipping_category_id: 1},
  {id: 18, product_type_id: 1, name: 'Piccolo', description: 'A baby latte as the Italian pronunciation suggests.', shipping_category_id: 1},
])

puts 'Deleting All Variants'
Variant.delete_all
'Creating Sample Variants'
Variant.create!([
  {id: 1, product_id: 2, price: 2.95, master: 1},
  {id: 2, product_id: 2, price: 3.95},
  {id: 3, product_id: 2, price: 4.95},
  # {id: 4, product_id: 2, price: 3.95, name: 'Cappuccino - Venti'},
  {id: 5, product_id: 4, price: 2.95, master: 1},
  {id: 6, product_id: 4, price: 3.95},
  # {id: 7, product_id: 2, price: 4.95, name: 'Bubble Tea - Grande'},
  # {id: 8, product_id: 3, price: 3.95, name: 'Cappuccino - Venti'}
])


puts 'Deleting Sample Products with Attributes'
ProductProperty.delete_all
puts 'Creating Sample Products with Attributes'
ProductProperty.create!([
  {property_id: 1, product_id: 2},
  # {property_id: 1, product_id: 2},
  # {property_id: 1, product_id: 3},
  # {property_id: 1, product_id: 4},
  # {property_id: 3, product_id: 1},
])

puts 'Deleting Sample Menu Items with Attributes'
VariantProperty.delete_all
puts 'Creating Sample Menu Items with Attributes'
VariantProperty.create!([
    {property_id: 1, variant_id: 1, description: 'Short', primary: 1},
    {property_id: 1, variant_id: 1, description: 'Tall', primary: 0},
    {property_id: 1, variant_id: 1, description: 'Grande', primary: 0},
    {property_id: 1, variant_id: 1, description: 'Venti', primary: 1},
    # {property_id: 1, variant_id: 5, description: 'Short', primary: 1},
    # {property_id: 1, variant_id: 6, description: 'Tall', primary: 1},
    # {property_id: 1, variant_id: 7, description: 'Grande', primary: 0},
    # {property_id: 1, variant_id: 8, description: 'Venti', primary: 1},
    {property_id: 2, variant_id: 1, description: 'Full Cream', primary: 1},
    {property_id: 2, variant_id: 1, description: 'Skim'},
    {property_id: 2, variant_id: 1, description: 'Soy'},
])

puts 'Deleting All Properties'
Property.delete_all
puts 'Sugar CRUSH!'
Property.create!([
  {id:1, display_name: 'Size', identifying_name: :Size},
  {id:2, display_name: 'Milk' , identifying_name: :Milk},
  {id:3, display_name: 'Sugar' , identifying_name: :Sugar},
  {id:4, display_name: 'Coffee Blend' , identifying_name: 'Coffee Blend'},
  {id:5, display_name: 'Strength' , identifying_name: :Strenth},
  {id:6, display_name: 'Extra Shot', identifying_name: 'Extra Shot'},
  {id:7, display_name: 'Syrup', identifying_name: :Syrup},
  {id:8, display_name: 'Flavour', identifying_name: :Flavour},
  {id:9, display_name: 'Topping', identifying_name: :Toppings},
  {id:10, display_name: 'Sweetness', identifying_name: :Sweetness}
])


puts 'Deleting All Suppliers'
Supplier.delete_all
# (1..100).each do |i|
#   Supplier.create!(id: i, name: SecureRandom.hex(6), address: '20/ 94 Abbott Rd, Hallam, VIC 3803', email:'test@test.com')
# end
Supplier.create!([
 {id: 1, name: 'Latte Cartelle Drive Thru Coffee', address: '241 - 245 Princes Hwy, Hallam, VIC 3803', email: 'test@test.com', featured: true},
 {id: 2, name: 'Wedgewood Cafe', address: 'Unit 1/ 94 Wedgewood Rd, Hallam, VIC 3803', email: 'test@test.com'},
 {id: 3, name: 'Fresch Cafe', address: '20/ 94 Abbott Rd, Hallam, VIC 3803', email: 'test@test.com'},
 {id: 4, name: 'Nar Nar Goon Take-Away Cafe', address: '1 Main St, Nar Nar Goon, VIC 3812', email: 'test@test.com'}
])

puts 'Deleting Sample Suppliers with Menu Items'
VariantSupplier.delete_all
puts 'Creating Sample Suppliers with Menu Items'
VariantSupplier.create!([
    {supplier_id: 1, variant_id: 1},
    {supplier_id: 1, variant_id: 2},
    {supplier_id: 1, variant_id: 3},
    {supplier_id: 1, variant_id: 4},
    {supplier_id: 2, variant_id: 5},
    {supplier_id: 2, variant_id: 6},
    {supplier_id: 2, variant_id: 7},
    {supplier_id: 3, variant_id: 8}
])

puts 'Deleting All Cart Items'
CartItem.delete_all
# puts 'Creating Order Statuses'
# CartItem.create!([
#   {id: 1, user_id: 1, cart_id: 1, variant_id: 3, quantity: 4, item_type_id: 1, active: true}
# ])


puts 'Deleting All Order Statues'
OrderStatus.delete_all
puts 'Creating Order Statuses'
OrderStatus.create!([
 {id: 1, name: 'Order Received', description: 'Bean\'n\'Gone has received your order'},
 {id: 2, name: 'In Progress', description: 'The barista has started preparing your order'},
 {id: 3, name: 'Ready for Collection', description: 'Order is ready for collection'},
 {id: 4, name: 'Collected', description: 'Order has been collected'}
])

puts 'Deleting All Order Items'
OrderItem.delete_all

puts 'Deleting All Orders'
Order.delete_all

puts 'She may not look like much, but she\'s got it where it counts, kid!'


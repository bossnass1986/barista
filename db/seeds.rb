puts 'Did you hear that? They shut down the main reactor.'

puts 'Deleting All Users'
User.delete_all
puts 'Creating Control Users'
User.create!(id:1, name: 'Admin', mobile: '0430091464', email: 'admin@bng.com.au', password: 'paul1234').add_role(:admin)
User.create!(id:2, name: 'Owner', mobile: '0430091461', email: 'owner@bng.com.au', password: 'paul1234').add_role(:owner)
User.create!(id:3, name: 'Paul McGuane', mobile: '0430091462', email: 'user@bng.com.au', password: 'paul1234').add_role(:user)

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
  {id: 1, name: 'Coffee / Hot Drinks'},
  {id: 2, name: 'Cold Drinks'},
  {id: 3, name: 'Juices'},
])

puts 'Deleting All Menu Items'
Product.delete_all
puts 'Creating Standard Menu Items'
Product.create!([
  {id: 1, product_type_id: 2, name: 'Bubble Tea', description: 'A normal, regular milk cappuccino'},
  {id: 2, product_type_id: 1, name: 'Cappuccino', description: 'Silky frothed milk poured over a shot of espresso, topped with a touch of chocolate.'},
  {id: 3, product_type_id: 1, name: 'Chai Latte', description: 'A normal, regular milk latte'},
  {id: 4, product_type_id: 1, name: 'Flat White', description: 'Steamed milk with small, fine bubbles and a glossy or velvety consistency poured over a shot of espresso.'},
  {id: 5, product_type_id: 1, name: 'Frappe', description: 'A normal, regular milk macchiato'},
  {id: 6, product_type_id: 1, name: 'Hot Chocolate', description: 'Silky steamed milk poured over melted chocolate topped with chocolate powder'},
  {id: 7, product_type_id: 2, name: 'Iced Chocolate', description: 'A normal, regular milk coffee'},
  {id: 8, product_type_id: 2, name: 'Iced Coffee', description: 'A normal, regular milk latte'},
  {id: 9, product_type_id: 2, name: 'Iced Tea', description: 'A normal, regular milk macchiato'},
  {id: 10, product_type_id: 1, name: 'Irish', description: 'A normal, regular milk macchiato'},
  {id: 11, product_type_id: 1, name: 'Latte', description: 'A drink made by adding perfectly steamed milk to a shot of espresso served in a glass.'},
  {id: 12, product_type_id: 1, name: 'Latte Macchiato', description: 'A normal, regular milk coffee'},
  {id: 13, product_type_id: 1, name: 'Long Black', description: 'A long black is made by pouring a double-shot of espresso or ristretto over hot water.'},
  {id: 14, product_type_id: 1, name: 'Macchiato', description: 'A single shot of espresso with a small amount of steamed milk.'},
  {id: 15, product_type_id: 1, name: 'Mocha', description: 'Mocha, in its most basic formulation, can also be referred to as hot chocolate with a shot of espresso added to it.'},
  {id: 16, product_type_id: 1, name: 'Short Black', description: 'A single shot of espresso.'},
  {id: 17, product_type_id: 1, name: 'Tea', description: 'A normal, regular milk coffee'},
  {id: 18, product_type_id: 1, name: 'Piccolo', description: 'A baby latte as the Italian pronunciation suggests.'},
])

puts 'Deleting All Variants'
Variant.delete_all
'Creating Sample Variants'
Variant.create!([
  {id: 1, product_id: 1, price: 2.95, name: 'Bubble Tea - Short'},
  {id: 2, product_id: 1, price: 3.95, name: 'Bubble Tea - Tall'},
  {id: 3, product_id: 1, price: 4.95, name: 'Bubble Tea - Grande'},
  {id: 4, product_id: 2, price: 3.95, name: 'Cappuccino - Venti'},
  {id: 5, product_id: 4, price: 2.95, name: 'Bubble Tea - Short'},
  {id: 6, product_id: 4, price: 3.95, name: 'Bubble Tea - Tall'},
  {id: 7, product_id: 2, price: 4.95, name: 'Bubble Tea - Grande'},
  {id: 8, product_id: 3, price: 3.95, name: 'Cappuccino - Venti'}
])


puts 'Deleting Sample Products with Attributes'
ProductProperty.delete_all
puts 'Creating Sample Products with Attributes'
ProductProperty.create!([
  {property_id: 1, product_id: 1},
  {property_id: 1, product_id: 2},
  {property_id: 1, product_id: 3},
  {property_id: 1, product_id: 4},
  {property_id: 3, product_id: 1},
])

puts 'Deleting Sample Menu Items with Attributes'
VariantProperty.delete_all
puts 'Creating Sample Menu Items with Attributes'
VariantProperty.create!([
    {property_id: 1, variant_id: 1, description: 'Short', primary: 1},
    {property_id: 1, variant_id: 2, description: 'Tall', primary: 1},
    {property_id: 1, variant_id: 3, description: 'Grande', primary: 0},
    {property_id: 1, variant_id: 4, description: 'Venti', primary: 1},
    {property_id: 1, variant_id: 5, description: 'Short', primary: 1},
    {property_id: 1, variant_id: 6, description: 'Tall', primary: 1},
    {property_id: 1, variant_id: 7, description: 'Grande', primary: 0},
    {property_id: 1, variant_id: 8, description: 'Venti', primary: 1},
    {property_id: 2, variant_id: 1, description: 'Full Cream'},
    {property_id: 2, variant_id: 1, description: 'Skim'},
    {property_id: 2, variant_id: 1, description: 'Soy'},
])

puts 'Deleting All Properties'
Property.delete_all
puts 'Creating Standard Properties'
Property.create!([
  {id:1, display_name: 'Size', identifying_name: :Size},
  {id:2, display_name: 'Milk' , identifying_name: :Milk},
  {id:3, display_name: 'Sugar' , identifying_name: :Sugar},
  {id:4, display_name: 'Coffee Blend' , identifying_name: 'Coffee Blend'},
  {id:5, display_name: 'Strength' , identifying_name: :Strenth},
  {id:6, display_name: 'Extra Shot', identifying_name: 'Extra Shot'},
  {id:7, display_name: 'Syrup', identifying_name: :Syrup}
])


puts 'Deleting All Suppliers'
Supplier.delete_all
puts 'Creating Sample Suppliers'
Supplier.create!([
 {id: 1, name: 'Latte Cartelle Drive Thru Coffee', address: '241 - 245 Princes Hwy, Hallam, VIC 3803', email: 'test@test.com'},
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
    {supplier_id: 2, variant_id: 8}
])

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
puts 'Creating Sample Order Items'
OrderItem.create!([
  {id: 1, price: 4.95, total: 4.95, order_id: 1, variant_id: 1},
  {id: 2, price: 5.95, total: 5.95, order_id: 1, variant_id: 2},
])


puts 'Deleting All Orders'
Order.delete_all
puts 'Creating Sample Orders'
Order.create!([
  {id: 1, calculated_at: '2013-01-18 17:07:29', completed_at: '2013-01-18 18:55:00', user_id: '1', order_status_id: 1},
  {id: 2, calculated_at: '2013-01-22 15:56:08', completed_at: '2013-01-22 16:02:00', user_id: '1', order_status_id: 2},
  {id: 3, calculated_at: '2013-01-31 17:37:58', completed_at: '2013-02-06 22:22:00', user_id: '2', order_status_id: 3},
  {id: 4, completed_at: '2013-02-06 22:22:00', user_id: '1', order_status_id: 4}
])

puts 'She may not look like much, but she\'s got it where it counts, kid!'


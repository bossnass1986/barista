puts 'Did you hear that? They shut down the main reactor.'

puts 'Deleting All Users'
User.delete_all
puts 'Creating Control Users'
User.create!(id:1, name: 'Admin', mobile: '0430091464', email: 'admin@bng.com.au', password: 'paul1234').add_role(:admin)
User.create!(id:2, name: 'Owner', mobile: '0430091461', email: 'owner@bng.com.au', password: 'paul1234').add_role(:owner)
User.create!(id:3, name: 'User', mobile: '0430091462', email: 'user@bng.com.au', password: 'paul1234').add_role(:user)


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
  # {id: 1, name: 'Bubble Tea', description: 'A normal, regular milk cappuccino'},
  {id: 2, product_type_id: 1, name: 'Cappuccino', description: 'Silky frothed milk poured over a shot of espresso, topped with a touch of chocolate.'},
  # {id: 3, product_type_id: 1, name: 'Chai Latte', description: 'A normal, regular milk latte'},
  {id: 4, product_type_id: 1, name: 'Flat White', description: 'Steamed milk with small, fine bubbles and a glossy or velvety consistency poured over a shot of espresso.'},
  # {id: 5, product_type_id: 1, name: 'Frappe', description: 'A normal, regular milk macchiato'},
  {id: 6, product_type_id: 1, name: 'Hot Chocolate', description: 'Silky steamed milk poured over melted chocolate topped with chocolate powder'},
  # {id: 7, product_type_id: 2, name: 'Iced Chocolate', description: 'A normal, regular milk coffee'},
  # {id: 8, product_type_id: 2, name: 'Iced Coffee', description: 'A normal, regular milk latte'},
  # {id: 9, product_type_id: 2, name: 'Iced Tea', description: 'A normal, regular milk macchiato'},
  # {id: 10, product_type_id: 1, name: 'Irish', description: 'A normal, regular milk macchiato'},
  {id: 11, product_type_id: 1, name: 'Latte', description: 'A drink made by adding perfectly steamed milk to a shot of espresso served in a glass.'},
  # {id: 12, product_type_id: 1, name: 'Latte Macchiato', description: 'A normal, regular milk coffee'},
  {id: 13, product_type_id: 1, name: 'Long Black', description: 'A long black is made by pouring a double-shot of espresso or ristretto over hot water.'},
  {id: 14, product_type_id: 1, name: 'Macchiato', description: 'A single shot of espresso with a small amount of steamed milk.'},
  {id: 15, product_type_id: 1, name: 'Mocha', description: 'Mocha, in its most basic formulation, can also be referred to as hot chocolate with a shot of espresso added to it.'},
  {id: 16, product_type_id: 1, name: 'Short Black', description: 'A single shot of espresso.'},
  # {id: 17, name: 'Tea', description: 'A normal, regular milk coffee'},
  {id: 18, product_type_id: 1, name: 'Piccolo', description: 'A baby latte as the Italian pronunciation suggests.'},
])

puts 'Deleting All Variants'
Variant.delete_all
'Creating Sample Variants'
Variant.create!([
  {id: 1, product_id: 2, price: 3.95},
  {id: 2, product_id: 2, price: 4.95},
  {id: 3, product_id: 2, price: 5.95},
  {id: 4, product_id: 2, price: 7.95}
])

puts 'Deleting All Properties'
Property.delete_all
puts 'Creating Standard Properties'
Property.create!([
  {id:1, name: 'Size'},
  {id:2, name: 'Milk'},
  {id:3, name: 'Sugar'},
  {id:4, name: 'Coffee Blend'},
  {id:5, name: 'Strength'},
  {id:6, name: 'Extra Shot'},
  {id:7, name: 'Syrup'}
])

puts 'Deleting Sample Menu Items with Attributes'
VariantProperty.delete_all
puts 'Creating Sample Menu Items with Attributes'
VariantProperty.create!([
  {property_id: 1, variant_id: 1, venue_id: 1, description: 'Short', primary: 1},
  {property_id: 1, variant_id: 2, venue_id: 1, description: 'Tall', primary: 0},
  {property_id: 1, variant_id: 3, venue_id: 1, description: 'Grande', primary: 0},
  {property_id: 1, variant_id: 4, venue_id: 1, description: 'Venti', primary: 0},
  {property_id: 3, variant_id: 1, venue_id: 1, description: 'Regular'},
  # {property_id: 3, variant_id: 1, venue_id: 1, description: 'Skim'},
  # {property_id: 3, variant_id: 1, venue_id: 1, description: 'Soy'},
  # {property_id: 3, variant_id: 1, venue_id: 1, description: 'Almond'},
  # {property_id: 4, variant_id: 1, venue_id: 1, description: 'One'},
  # {property_id: 4, variant_id: 1, venue_id: 1, description: 'Two'},
  # {property_id: 4, variant_id: 1, venue_id: 1, description: 'Three'},
  # {property_id: 5, variant_id: 5, venue_id: 1, description: 'Regular'},
  # {property_id: 5, variant_id: 5, venue_id: 1, description: 'Single Origin'},
  # {property_id: 5, variant_id: 5, venue_id: 1, description: 'Decaf'},
  # {property_id: 6, variant_id: 5, venue_id: 1, description: 'Weak'},
  # {property_id: 6, variant_id: 5, venue_id: 1, description: 'Regular'},
  # {property_id: 6, variant_id: 5, venue_id: 1, description: 'Strong'},
  # {property_id: 6, variant_id: 5, venue_id: 1, description: 'Extra Strong'}
])

puts 'Deleting All Venues'
Venue.delete_all
puts 'Creating Sample Venues'
Venue.create!([
 {id: 1, name: 'Latte Cartelle Drive Thru Coffee', address: '241 - 245 Princes Hwy, Hallam, VIC 3803'},
 {id: 2, name: 'Wedgewood Cafe', address: 'Unit 1/ 94 Wedgewood Rd, Hallam, VIC 3803'},
 {id: 3, name: 'Fresch Cafe', address: '20/ 94 Abbott Rd, Hallam, VIC 3803'},
 {id: 4, name: 'Nar Nar Goon Take-Away Cafe', address: '1 Main St, Nar Nar Goon, VIC 3812'}
])

# CartItem.delete_all
# CartItem.create!([
#  {id: 1, order_id: 1, product_id: 1, unit_price: 5.95, quantity: 5, total_price: 5.95 * 5},
#  {id: 2, order_id: 1, product_id: 3, unit_price: 3.95, quantity: 2, total_price: 3.95 * 2}
# ])

# ProductsVenues.delete_all
# ProductsVenues.create!([
#  {product_id: 1, venue_id: 1},
#  {variant_id: 1, venue_id: 2},
#  {variant_id: 1, venue_id: 3},
#  {variant_id: 1, venue_id: 4},
#  {variant_id: 1, venue_id: 5}
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


puts 'Deleting All Orders'
Order.delete_all
puts 'Creating Sample Orders'
Order.create!([
  {id: 1, placed: '2013-01-18 17:07:29', fulfilled: '2013-01-18 18:55:00', user_id: '1', special_instructions: ''},
  {id: 2, placed: '2013-01-22 15:56:08', fulfilled: '2013-01-22 16:02:00', user_id: '1', special_instructions: 'extra hot'},
  {id: 3, placed: '2013-01-31 17:37:58', fulfilled: '2013-02-06 22:22:00', user_id: '2', special_instructions: ''},
  {id: 4, fulfilled: '2013-02-06 22:22:00', user_id: '1', special_instructions: ''}
])
# StoreConfig.delete_all
StoreConfig.create!([
  {name: 'status', value: 'open'},
  {name: 'milks', value: 'regular, soy, skim'},
  {name: 'busy_until', value: ''},
  {name: 'avg_wait_time', value: '4'}
])
puts 'She may not look like much, but she\'s got it where it counts, kid'


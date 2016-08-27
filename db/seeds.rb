puts 'Did you hear that? They shut down the main reactor.'
puts 'Execute Order 66!'
Role.destroy_all
User.delete_all
Country.destroy_all
MerchantType.delete_all
ProductType.delete_all
Prototype.delete_all
Product.delete_all
Variant.destroy_all
PrototypeProperty.delete_all
ProductProperty.delete_all
VariantMerchant.delete_all
VariantProperty.delete_all
Cart.destroy_all
Order.destroy_all
Property.delete_all

%w(customer banned merchant staff admin).each do |role|
  Role.find_or_create_by({name: role})
end

puts 'The Force is strong with this one.'
User.create!(first_name: 'Paul', last_name: 'McGuane', mobile: '0430091465', email: 'admin@cup.town', password: 'cuptwn')


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

puts 'The regional governors now have direct control over their territories. '
file_to_load  = Rails.root + 'db/seed/states.yml'
states_list   = YAML::load( File.open( file_to_load ) )

states_list.each_pair do |key,state|
  s = State.find_by(abbreviation: state['attributes']['abbreviation'], country_id: state['attributes']['country_id'])
  State.create(state['attributes']) unless s
end

puts 'Creating Standard Merchant Types'
MerchantType.create!([
                         {id: 1, name: 'Cafe', active: true},
                         {id: 2, name: 'Smoothie/Juice Bar', active: true},
                         {id: 3, name: 'Bubble Tea', active: true},
                         {id: 4, name: 'Bar/Pub', active: true}
                     ])

puts 'Creating Standard Product Types'
ProductType.create!([
                        {id: 1, name: 'Coffee', merchant_type_id: 1},
                        {id: 2, name: 'Hot Drinks', merchant_type_id: 1},
                        {id: 3, name: 'Iced Drinks', merchant_type_id: 1},
                        {id: 4, name: 'Cold Drinks', merchant_type_id: 1},
                        {id: 5, name: 'Smoothie', merchant_type_id: 1},
                        {id: 6, name: 'Frappe', merchant_type_id: 1},
                        {id: 7, name: 'Food', merchant_type_id: 1},
                        {id: 8, name: 'Vodka'},
                        {id: 9, name: 'Bourbon'},
                        {id: 10, name: 'Scotch'}
])

# puts 'Creating Standard Product Types'
# Prototype.create!([
#     {id: 1, name: 'Hot', active: true},
#     {id: 2, name: 'Cold', active: true}
# ])

PrototypeProperty.create!([
                            {property_id: 1, prototype_id: 1},
                            {property_id: 1, prototype_id: 2},
                            {property_id: 2, prototype_id: 1},
                            {property_id: 2, prototype_id: 2},
                            {property_id: 3, prototype_id: 1},
                            {property_id: 4, prototype_id: 1},
                            {property_id: 5, prototype_id: 1},
                            {property_id: 5, prototype_id: 2},
                          ])

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

puts 'Creating Standard Menu Items'

product_seed = Rails.root.join('db', 'seed', 'products.yml')
product = YAML::load_file(product_seed)
Product.create!(product)

#
# puts 'Creating Sample Products with Attributes'
# ProductProperty.create!([
#   {property_id: 1, product_id: 2, description: 'Size'},
#   # {property_id: 1, product_id: 2},
#   # {property_id: 1, product_id: 3},
#   # {property_id: 1, product_id: 4},
#   # {property_id: 3, product_id: 1},
# ])

# puts 'Creating Sample Menu Items with Attributes'
# VariantProperty.create!([
#     {property_id: 1, variant_id: 1, description: 'Short', primary: 1},
#     {property_id: 1, variant_id: 1, description: 'Tall', primary: 0},
#     {property_id: 1, variant_id: 1, description: 'Grande', primary: 0},
#     {property_id: 1, variant_id: 1, description: 'Venti', primary: 1},
#     # {property_id: 1, variant_id: 5, description: 'Short', primary: 1},
#     # {property_id: 1, variant_id: 6, description: 'Tall', primary: 1},
#     # {property_id: 1, variant_id: 7, description: 'Grande', primary: 0},
#     # {property_id: 1, variant_id: 8, description: 'Venti', primary: 1},
#     {property_id: 2, variant_id: 1, description: 'Full Cream', primary: 1},
#     {property_id: 2, variant_id: 1, description: 'Skim'},
#     {property_id: 2, variant_id: 1, description: 'Soy'},
# ])


(1..100).each do |i|
  Merchant.create!(name: SecureRandom.hex(6), email: 'test@test.com')
end
# Merchant.create!([
#   {name: 'Latte Cartelle Drive Thru Coffee', email: 'test@test.com', featured: true},
#   {name: 'Wedgewood Cafe', email: 'test@test.com'},
#   {name: 'Fresch Cafe', email: 'test@test.com'},
#   {name: 'Nar Nar Goon Take-Away Cafe', email: 'test@test.com'},
#   {name: 'Latte Cartelle Drive Thru Coffee1', email: 'test@test.com', featured: true},
#   {name: 'Wedgewood Cafe1', email: 'test@test.com'},
#   {name: 'Fresch Cafe1', email: 'test@test.com'},
#   {name: 'Nar Nar Goon Take-Away Cafe1', email: 'test@test.com'}
# ])

# puts 'Creating Sample Merchants with Menu Items'
# VariantMerchant.create!([
#     {merchant_id: 1, variant_id: 1},
#     {merchant_id: 1, variant_id: 2},
#     {merchant_id: 1, variant_id: 3},
#     {merchant_id: 1, variant_id: 4},
#     {merchant_id: 1, variant_id: 5},
#     {merchant_id: 1, variant_id: 6},
#     {merchant_id: 1, variant_id: 7},
#     {merchant_id: 1, variant_id: 8}
# ])


# puts "Referral Bonuses"
# ReferralBonus::BONUSES.each do |referral_bonus_attributes|
#   rb = ReferralBonus.find_by(name: referral_bonus_attributes[:name])
#   unless rb
#     ReferralBonus.create(referral_bonus_attributes)
#   end
# end

puts 'Referral PROGRAMS'
ReferralProgram::PROGRAMS.each do |referral_program_attributes|
  rp = ReferralProgram.find_by(name: referral_program_attributes[:name])
  unless rp
    ReferralProgram.create(referral_program_attributes)
  end
end

puts 'ReferralType'
ReferralType::NAMES.each do |name|
  ReferralType.find_or_create_by(name: name)
end


puts 'PHONE TYPES'
PhoneType::NAMES.each do |phone_type|
  PhoneType.find_or_create_by(name: phone_type)
end

puts 'She may not look like much, but she\'s got it where it counts, kid!'


puts 'Did you hear that? They shut down the main reactor.'
puts 'Execute Order 66!'
Role.destroy_all
User.delete_all
Country.destroy_all
# MerchantType.delete_all
Category.destroy_all
Product.delete_all
PropertySet.destroy_all
Property.delete_all
# Product.destroy_all
Variant.destroy_all
# PrototypeProperty.delete_all
# ProductAttribute.delete_all
VariantMerchant.delete_all
VariantProperty.delete_all
Cart.destroy_all
Order.destroy_all
# Property.delete_all

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

puts 'Creating Categories'
Category.create!([
                        {id: 1, name: 'Coffee'},
                        {id: 2, name: 'Hot Drinks'},
                        {id: 3, name: 'Iced Drinks'},
                        {id: 4, name: 'Cold Drinks'},
                        {id: 5, name: 'Smoothie'},
                        {id: 6, name: 'Frappe'},
                        {id: 7, name: 'Food'},
                        {id: 8, name: 'Vodka'},
                        {id: 9, name: 'Bourbon'},
                        {id: 10, name: 'Scotch'}
])

puts 'Sugar CRUSH!'
PropertySet.create!([
                   {id:1, name: 'Size'},
                   {id:2, name: 'Milk'},
                   {id:3, name: 'Sugar'},
                   {id:4, name: 'Coffee Blend'},
                   {id:5, name: 'Strength'},
                   {id:6, name: 'Extra Shot'},
                   {id:7, name: 'Syrup'},
                   {id:8, name: 'Flavour'},
                   {id:9, name: 'Topping'},
                   {id:10, name: 'Sweetness'}
                ])

# puts 'Creating Standard Menu Items'
#
# product_seed = Rails.root.join('db', 'seed', 'products.yml')
# product = YAML::load_file(product_seed)
# Product.create!(product)

puts 'Creating Attributes'
Property.create!([
    # Sizes
    {property_set_id: 1, name: 'Short'},
    {property_set_id: 1, name: 'Tall'},
    {property_set_id: 1, name: 'Grande'},
    {property_set_id: 1, name: 'Venti'},
    # Milk
    {property_set_id: 2, name: 'Full Cream'},
    {property_set_id: 2, name: 'Skim'},
    {property_set_id: 2, name: 'Soy'},
    {property_set_id: 2, name: 'Lactose Free'},
    {property_set_id: 2, name: 'Almond'},
    {property_set_id: 2, name: 'Coconut'},
    # Sugar
    {property_set_id: 3, name: 'None'},
    {property_set_id: 3, name: '1/2'},
    {property_set_id: 3, name: '1'},
    {property_set_id: 3, name: '2'},

    # Strength
    {property_set_id: 5, name: 'Weak'},
    {property_set_id: 5, name: 'Regular'},
    {property_set_id: 5, name: 'Strong'},
    {property_set_id: 5, name: 'Extra Strong'},

    # Flavouring
    {property_set_id: 8, name: 'None'},
    {property_set_id: 8, name: 'Vanilla'},
    {property_set_id: 8, name: 'Carmel'},
    {property_set_id: 8, name: 'Hazelnut'},
])


# (1..100).each do |i|
#   Merchant.create!(name: SecureRandom.hex(6), email: 'test@test.com')
# end
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


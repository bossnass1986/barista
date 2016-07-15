class MerchantType < ActiveRecord::Base
  has_many :merchants
  has_one :product_type
end

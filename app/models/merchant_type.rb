class MerchantType < ActiveRecord::Base
  has_many :merchants, :through => :product_types, dependent: :destroy
  has_one :product_type
end

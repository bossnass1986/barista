class MerchantProduct < ActiveRecord::Base
  belongs_to :merchant
  has_one :property_set
  has_many :merchants, :through => :property_set, dependent: :destroy
end

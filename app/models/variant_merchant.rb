class VariantMerchant < ActiveRecord::Base

  # belongs_to :merchant
  # belongs_to :variant

  validates :variant_id,  :presence => true
  validates :merchant_id, :presence => true
  # validates :cost,        :presence => true

  accepts_nested_attributes_for :variant

end
class Property < ActiveRecord::Base

  belongs_to :property_set
  # has_many :@product_attributes
  # has_many :products,          :through => :@product_attributes
  #
  # has_many :variant_properties
  # has_many :variants,          :through => :variant_properties

  validates :name,       :presence => true, :length => { :maximum => 165 }


end

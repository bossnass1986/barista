class Variant < ActiveRecord::Base

  belongs_to :product

  has_many :variant_properties
  has_many :properties,        through: :variant_properties

  validates :price,       presence: true
  validates :product_id,  presence: true


  def active?
    deleted_at.nil? || deleted_at > Time.zone.now
  end

  # returns the product name
  #  ex: obj.product_name => Latte
  #
  # @param [none]
  # @return [String]
  def product_name
    name? ? name : [product.name].reject{ |a| a.strip.length == 0 }.join(' - ')
  end

  # returns the primary_property's description or a blank string
  #  ex: obj.sub_name => 'A normal, regular milk coffee'
  #
  # @param [none]
  # @return [String]
  def sub_name
    primary_property ? "#{primary_property.description}" : ''
  end
end

class VariantRequiredError < StandardError
end

class Product < ActiveRecord::Base

  has_one :product_type

  belongs_to :venue
  belongs_to :cart_item

  has_many :product_properties
  has_many :properties,         through: :product_properties
  has_many :variants

  has_many :active_variants, -> { where(deleted_at: nil) }, class_name: 'Variant'

  has_and_belongs_to_many :orders

  validates :name, presence: true, length: { maximum: 165 }
  validates :product_type_id, presence: true


  def hero_variant
    active_variants.detect{|v| v.master } || active_variants.first
  end


  # Price of cheapest variant
  #
  # @param [none]
  # @return [Decimal] price
  def price
    active_variants.present? ? price_range.first : '-'
  end

  # range of the product prices (Just teh low and high price) as an array
  #
  # @param [none]
  # @return [Array] [Low price, High price]
  def price_range
    return @price_range if @price_range
    return @price_range = ['N/A', 'N/A'] if active_variants.empty?
    @price_range = active_variants.minmax {|a,b| a.price <=> b.price }.map(&:price)
  end

  # Answers if the product has a price range or just one price.
  #   if there is more than one price returns true
  #
  # @param [none]
  # @return [Boolean] true == there is more than one price
  def price_range?
    !(price_range.first == price_range.last)
  end

  def self.active
    where('products.deleted_at IS NULL OR products.deleted_at > ?', Time.zone.now)
    #  Add this line if you want the available_at to function
    #where("products.available_at IS NULL OR products.available_at >= ?", Time.zone.now)
  end

  def active(at = Time.zone.now)
    deleted_at.nil? || deleted_at > (at + 1.second)
  end

  def active?(at = Time.zone.now)
    active(at)
  end

  private

    def has_active_variants?
      active_variants.any?{|v| v.is_available? }
    end

    def not_active_on_create!
      self.deleted_at ||= Time.zone.now
    end

end

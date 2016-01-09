class VariantRequiredError < StandardError
end

class Product < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :description]

  has_one :product_type


  has_many :product_properties
  has_many :properties,         through: :product_properties
  has_many :variants

  has_many :active_variants, -> { where(deleted_at: nil) }, class_name: 'Variant'

  has_and_belongs_to_many :orders

  validates :name, presence: true, length: { maximum: 165 }
  validates :product_type_id, presence: true

  accepts_nested_attributes_for :variants,           reject_if: proc { |attributes| attributes['sku'].blank? }
  accepts_nested_attributes_for :product_properties, reject_if: proc { |attributes| attributes['description'].blank? }, allow_destroy: true

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

  # range of the product prices (Just the low and high price) as an array
  #
  # @param [none]
  # @return [Array] [Low price, High price]
  def price_range
    return @price_range if @price_range
    return @price_range = %w(N/A N/A) if active_variants.empty?
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

  def image_available(product)
    (Rails.application.assets.find_asset("products/#{product.downcase.tr(' ', '-')}.jpg").nil?) ?
        ActionController::Base.helpers.image_tag('products/generic.jpg', size: '50', alt: product.titlecase, title: product.titlecase) :
        ActionController::Base.helpers.image_tag("products/#{product.downcase.tr(' ', '-')}.jpg", size: '50', alt: product.titlecase, title: product.titlecase)
  end

  def active(at = Time.zone.now)
    deleted_at.nil? || deleted_at > (at + 1.second)
  end

  def active?(at = Time.zone.now)
    active(at)
  end

  def is_available
    has_active_variants?
  end

  def available?
    has_active_variants?
  end

  private

    def has_active_variants?
      active_variants.any?{|v| v.is_available? }
    end

    def not_active_on_create!
      self.deleted_at ||= Time.zone.now
    end

    def ensure_available
      if active? && deleted_at_changed?
        self.errors.add(:base, 'There must be active variants.')  if active_variants.blank?
        self.errors.add(:base, 'Variants must have inventory.')   unless active_variants.any?{|v| v.is_available? }
        self.deleted_at = deleted_at_was if active_variants.blank? || !active_variants.any?{|v| v.is_available? }
      end
    end

end

class VariantRequiredError < StandardError; end

class Product < ActiveRecord::Base

  has_many :categories_products
  has_many :categories, :through => :categories_products
  # include Presentation::ProductPresenter
  # include ProductFilters

  belongs_to :property_set
  has_many :product_attributes
  has_many :properties,         through: :product_properties
  has_many :variants, dependent: :destroy
  # has_many :images, -> {order(:position)},
  #          as:        :imageable,
  #          dependent: :destroy

  has_many :active_variants, -> { where(deleted_at: nil) },
           class_name: 'Variant'



  # accepts_nested_attributes_for :variants,           reject_if: proc { |properties| properties['sku'].blank? }
  # accepts_nested_attributes_for :@product_attributes, reject_if: proc { |properties| properties['description'].blank? }, allow_destroy: true
  # accepts_nested_attributes_for :images,             reject_if: proc { |t| (t['photo'].nil? && t['photo_from_link'].blank? && t['id'].blank?) }, allow_destroy: true

  validates :name,                  presence: true,   length: { maximum: 165 }
  validates_presence_of :categories

  def hero_variant
    active_variants.detect{|v| v.master } || active_variants.first
  end

  # gives you the tax rate for the give state_id and the time.
  #  Tax rates can change from year to year so Time is a factor
  #
  # @param [Integer] state.id
  # @param [Optional Time] Time now if no value is passed in
  # @return [TaxRate] TaxRate for the state at a given time
  def tax_rate(region_id, time = Time.zone.now)
    TaxRate.for_region(region_id).at(time).active.order('start_date DESC').first
  end

  # Image that is featured for your product
  #
  # @param [Optional Symbol] the size of the image expected back
  # @return [String] name of the file to terms from the public folder
  def featured_image(image_size = :small)
    # Rails.cache.fetch("Product-featured_image-#{id}-#{image_size}", expires_in: 3.hours) do
    #   images.first ? images.first.photo.url(image_size) : "no_image_#{image_size.to_s}.jpg"
    # end
  end

  def image_urls(image_size = :small)
    Rails.cache.fetch("Product-image_urls-#{id}-#{image_size}", expires_in: 3.hours) do
      images.empty? ? ["no_image_#{image_size.to_s}.jpg"] : images.map{|i| i.photo.url(image_size) }
    end
  end

  # Price of cheapest variant
  #
  # @param [none] the size of the image expected back
  # @return [Decimal] price
  def price
    active_variants.present? ? price_range.first : raise( VariantRequiredError )
  end

  # in the admin form this is the method called when the form is submitted, The method sets
  # the product_keywords attribute to an array of these values
  #
  # @param [String] value for set_keywords in a products form
  # @return [none]
  def set_keywords=(value)
    self.product_keywords = value ? value.split(',').map{|w| w.strip} : []
  end

  # method used by forms to set the array of keywords separated by a comma
  #
  # @param [none]
  # @return [String] product_keywords separated by comma
  def set_keywords
    product_keywords ? product_keywords.join(', ') : ''
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


  # This returns the first featured product in the database,
  # if there isn't a featured product the first product will be returned
  #
  # @param [none]
  # @return [ Product ]
  def self.featured
    product = where({ products: { featured: true} } ).includes(:images).first
    product ? product : includes(:images).where(['products.deleted_at IS NULL']).first
  end

  def self.active
    where("products.deleted_at IS NULL OR products.deleted_at > ?", Time.zone.now)
    #  Add this line if you want the available_at to function
    #where("products.available_at IS NULL OR products.available_at >= ?", Time.zone.now)
  end

  # def active(at = Time.zone.now)
  #   deleted_at.nil? || deleted_at > (at + 1.second)
  # end

  # def active?(at = Time.zone.now)
  #   active(at)
  # end

  def activate!
    self.deleted_at = nil
    save
  end

  def available?
    has_active_variants?
  end

  def has_shipping_method?
    shipping_category.shipping_rates.exists?
  end

  private

  def has_active_variants?
    active_variants.any?{|v| v.is_available? }
  end

  def sanitize_meta_description
    if name && description.present? && meta_description.blank?
      self.meta_description = [name.first(55), description.remove_hyper_text.first(197)].join(': ')
    end
  end

  def ensure_available
    if active? && deleted_at_changed?
      if active_variants.blank?
        self.errors.add(:base, 'There must be active variants.')
      end
      unless active_variants.any? { |v| v.is_available? }
        self.errors.add(:base, 'Variants must have inventory.')
      end
      if active_variants.blank? || !active_variants.any? { |v| v.is_available? }
        self.deleted_at = deleted_at_was
      end
    end
  end

  def assign_meta_keywords
    self.meta_keywords =  [name.first(55),
                           description.
                           remove_non_alpha_numeric.           # remove non-alpha numeric
                           remove_hyper_text.                  # remove hyper text
                           remove_words_less_than_x_characters. # remove words less than 2 characters
                           first(197)                       # limit to 197 characters
    ].join(': ')
  end
end
class Supplier < ActiveRecord::Base
  extend FriendlyId
  friendly_id :permalink, use: :finders

  has_many :variant_suppliers
  has_many :variants,         through: :variant_suppliers
  has_many :products, through: :variants

  # has_many :phones

  before_validation :sanitize_data

  validates :name,        presence: true,       length: { maximum: 255 }
  # validates :email,       format: { with: CustomValidators::Emails.email_validator },       :length => { :maximum => 255 }

  geocoded_by :address
  after_validation :geocode
  after_create :sanitize_dates

  def product_image_available(product)
    (Rails.application.assets.find_asset("products/#{product.downcase.tr(' ', '-')}.jpg").nil?) ?
        ActionController::Base.helpers.image_tag('products/generic.jpg', size: '50', alt: product.titlecase, title: product.titlecase) :
        ActionController::Base.helpers.image_tag("products/#{product.downcase.tr(' ', '-')}.jpg", size: '50', alt: product.titlecase, title: product.titlecase)
  end

  def image_available
    (Rails.application.assets.find_asset("places/#{self.id}.jpg").nil?) ?
        ActionController::Base.helpers.image_tag('products/generic.jpg', size: '72', alt: self.name.titlecase, title: self.name.titlecase) :
        ActionController::Base.helpers.image_tag("places/#{self.id}.jpg", size: '72', alt: self.name.titlecase, title: self.name.titlecase)
  end

  SQL_FIND_SIZES = "SELECT products.id,
                           LEFT(variant_properties.description,1) AS short_desc,
                           variants.price
                    FROM products
                    INNER JOIN product_properties ON product_properties.product_id = products.id
                    INNER JOIN variant_properties ON product_properties.property_id = variant_properties.property_id
                    INNER JOIN properties ON     properties.id           = product_properties.property_id
                                             AND properties.id           = variant_properties.property_id
                                             AND properties.display_name = 'Size'
                    INNER JOIN variants ON variants.product_id = products.id AND variants.id = variant_properties.variant_id"
  def self.sizes
    self.find_by_sql SQL_FIND_SIZES
  end

  def self.find_by_product_types(product_type_id)
    # return [] if product_type_id.nil?

    product_type = ProductType.find_by_id product_type_id
    product_types = product_type.self_and_descendants.map(&:id) if product_type

    # return if product_types.nil?
    # self.active
  # else
    self.where product_type_id: product_types
  end


  # if the permalink is not filled in set it equal to the name
  def sanitize_data
    sanitize_permalink
    # assign_meta_keywords  if meta_keywords.blank?
    sanitize_meta_description
    # sanitize_dates
  end

  def sanitize_dates
    self.available_at = self.created_at
  end

  def sanitize_permalink
    self.permalink = name if permalink.blank? && name
    self.permalink = [permalink.squeeze(' ').strip.gsub(/[^0-9a-z]/i, '-').downcase, self.address.first(25).gsub(/[^0-9a-z]/i, '-').downcase, self.id].join('-') if permalink
  end

  def sanitize_meta_description
    if name && meta_description.blank?
      self.meta_description = [name.first(55)]
    end
  end

end

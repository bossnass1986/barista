class Merchant < ActiveRecord::Base
  # extend FriendlyId
  # friendly_id :permalink, use: :finders

  has_many :variant_merchants
  has_many :variants, through: :variant_merchants, dependent: :destroy
  has_many :products, through: :variants, dependent: :destroy
  has_many :trading_hours, dependent: :destroy

  has_many    :phones,          dependent: :destroy,       as: :phoneable
  has_one     :primary_phone, -> { where(primary: true) }, as: :phoneable, class_name: 'Phone'

  has_one :address, as: :addressable, dependent: :destroy
  has_one :account, dependent: :destroy

  before_validation :sanitize_data
  after_create :add_trading_hours, :add_variants

  validates :terms_of_service, acceptance: true
  validates :name,        presence: true,       length: { maximum: 255 }
  validates :email,       format: { with: CustomValidators::Emails.email_validator },       :length => { :maximum => 255 }

  # after_create :sanitize_dates

  accepts_nested_attributes_for :address, reject_if: proc { |attributes| attributes['address1'].blank? }
  accepts_nested_attributes_for :trading_hours
  accepts_nested_attributes_for :phones, :reject_if => lambda { |t| ( t['display_number'].gsub(/\D+/, '').blank?) }
  accepts_nested_attributes_for :account, reject_if: proc { |attributes| attributes['account_name'].blank? }

  # @param [Object] day
  # @param [Object] hour
  def opening_status(day, hour)
    today_trading_hours = trading_hours.open_now(day, hour)
    if today_trading_hours.size > 0
      "Opened until #{today_trading_hours.first.close_time}"
    else
      "Closed"
    end
  end

  def open(day, hour, merchant)
    today_trading_hours = TradingHour.where("weekday = ? AND open_time > ? AND close_time < ? and merchant_id = ?", day, hour, hour, merchant)
    if today_trading_hours.size > 0
      "Opened until #{today_trading_hours.first.close_time}"
    else
      "Closed"
    end
  end

  def number_of_products
    # self.variants.product.group('products.id').count
    self.products.count(:id, :distinct => true)
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

  def add_trading_hours
    (0..6).each do |i|
      TradingHour.create!(merchant_id: self.id, weekday: i, trades: true)
    end
  end

  def add_variants
    @product = Product.all
    @product.each do |product|
      # @merchant = Merchant.variant.create!(product_id: product.id, sku: SecureRandom.hex(6), price: 3)
    end
  end

  # if the permalink is not filled in set it equal to the name
  def sanitize_data
    sanitize_permalink
    # assign_meta_keywords  if meta_keywords.blank?
    sanitize_meta_description
  end


  def sanitize_permalink
    self.permalink = name if permalink.blank? && name
    self.permalink = [permalink.squeeze(' ').strip.gsub(/[^0-9a-z]/i, '-').downcase].join('-') if permalink
  end

  def sanitize_meta_description
    if name && meta_description.blank?
      self.meta_description = [name.first(55)]
    end
  end

end

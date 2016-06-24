class StoreCredit < ActiveRecord::Base
  #attr_accessible :amount, :user_id, :user

  belongs_to :user

  validates :user_id, presence: true
  validates :amount , presence: true

  validates :amount, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}, :numericality => {:greater_than => 20, :less_than => 100}

  after_find :ensure_sql_math_rounding_issues

  before_save :set_expiration_date
  # removes amount from object using SQL math
  #
  # @param [Float] amount to remove
  # @return [none]
  def remove_credit(amount_to_remove)
    credit_amount = "#{self.amount} - #{amount_to_remove.to_f.round(2)}"
    self.update(amount: credit_amount)
  end

  def add_credit(amount_to_add)
    credit_amount = "#{self.amount} + #{amount_to_add.to_f.round(2)}"
    self.update(amount: credit_amount)
  end

  def set_expiration_date
    self.expire_at = Date.today + 6.months
  end

  def remaining_days
    expired? ? 0 : (Date.today - Subscription.expiry_date).to_i
  end

  def expired?
    (Date.today - Subscription.expiry_date).to_i <= 0
  end

  private

  def ensure_sql_math_rounding_issues
    self.amount = amount.to_f.round(2)
  end

  def expire_credits
    self.find_by_statement_cache

  end

end
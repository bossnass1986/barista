class StoreCredit < ActiveRecord::Base
  #attr_accessible :amount, :user_id, :user

  belongs_to :user

  validates :amount, presence: true

  after_find :ensure_sql_math_rounding_issues

  after_save :set_expiration_date
  # removes amount from object using SQL math
  #
  # @param [Float] amount to remove
  # @return [none]
  def remove_credit(amount_to_remove)
    credit_amount = self.amount - amount_to_remove.to_f.round(2)
    self.update(amount: credit_amount)
  end

  def add_credit(amount_to_add)
    credit_amount = self.amount + amount_to_add.to_f.round(2)
    self.update(amount: credit_amount)
  end

  def remaining_days
    expired? ? 0 : (self.expire_at.to_datetime - Date.today).to_i
  end

  def expired?
    (self.expire_at.to_datetime - Date.today).to_i <= 0
  end

  def process_braintree_payment(amount)
    result = Braintree::Transaction.sale(
        :amount => amount.to_f,
        # :order_id => "order id",
        :customer_id => customer_cim_id,
        :tax_amount => (amount.to_f / 11).round(2),
        :options => {
            :submit_for_settlement => true
        }
    )
    add_braintree_errors(result.error) unless result.success?
  end

  def add_braintree_errors(error_object)
    error_object.each do |error|
      errors.add(:braintree, error.message)
    end
  end

  private

  def set_expiration_date
    self.update_column(:expire_at, Date.today.end_of_day + 6.months)
  end

  def ensure_sql_math_rounding_issues
    self.amount = amount.to_f.round(2)
  end

  scope :expire_on, -> (date = Date.current) { where("expire_at <= ? and amount > 0", date.end_of_day) }

  class << self
    def expire_credits!(date = Date.current)
      # find all the expired credits on particular date, and update all together
      self.expire_on(date).update_all(amount: 0, last_expired_at: DateTime.current)
    end
    end

end
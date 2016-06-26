class StoreCredit < ActiveRecord::Base
  #attr_accessible :amount, :user_id, :user

  belongs_to :user

  validates :amount, presence: true

  after_find :ensure_sql_math_rounding_issues

  # after_save :set_expiration_date
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
    time_ago_in_words(self.expire_at)
    # distance_of_time_in_words(self.expire_at,Date.today)
    # expired? ? 0 : (self.expire_at - Date.today).to_i
  end

  def expired?
    (self.expire_at - Date.today).to_i <= 0
  end

  private

  def set_expiration_date
    self.update_column(:expire_at, Date.today + 6.months)
  end

  def ensure_sql_math_rounding_issues
    self.amount = amount.to_f.round(2)
  end

  def expire_credits
    self.find_by_statement_cache
  end

end
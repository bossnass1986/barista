class Myaccount::StoreCreditsController < Myaccount::BaseController

  def show
    @store_credit = current_user.store_credit
  end

  def edit
    form_info
  end

  def update
    if amount_to_add_is_valid?
      result = Braintree::Transaction.sale(
          :amount => params[:amount_to_add],
          :customer_id => current_user.customer_cim_id,
          :options => {
              :submit_for_settlement => true
          }
      )
      if result.success?
        p 'Transaction Successful'
        customer.store_credit.add_credit(amount_to_add)
        redirect_to admin_user_datas_user_store_credits_url(customer), :notice => "Successfully updated store credit."
      else
        result.errors.each do |error|
          puts error.message
          customer.errors.add(:base, error.message)
          form_info
          render :edit
        end
      end
    else
      customer.errors.add(:base, 'Amount must be numeric')
      form_info
      render :edit
    end
  end

  private
  def form_info

  end

  def customer
    @customer ||= User.includes(:store_credit).find(params[:current_user])
  end

  def amount_to_add_is_valid?
    params[:amount_to_add] && params[:amount_to_add].is_numeric?
  end

  def amount_to_add
    amount_to_add_is_valid? ? params[:amount_to_add].to_f : 0.0
  end

end
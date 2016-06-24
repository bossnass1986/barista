class Admin::UserDatas::StoreCreditsController < Admin::UserDatas::BaseController
  helper_method :customer

  def show
    @store_credit = customer.store_credit
  end

  def edit
    form_info
  end

  def update
    result = Braintree::Transaction.sale(
        :amount => :amount_added,
        :customer_id => customer.customer_cim_id,
        :options => {
            :submit_for_settlement => true
        }
    )
    if result.success?
      p 'Transaction Successful'
      customer.store_credit.add_credit(:amount_added)
      redirect_to admin_user_datas_user_store_credits_url(customer), :notice => "Successfully updated store credit."
    else
      result.errors.each do |error|
        puts error.message
        customer.errors.add(:base, error.message)
        form_info
        render :edit, :notice => error.message
      end
    end
  end

  private
  def form_info

  end

  def customer
    @customer ||= User.includes(:store_credit).find(params[:user_id])
  end

  def amount_added
    params[:amount_to_add].to_f
  end

end
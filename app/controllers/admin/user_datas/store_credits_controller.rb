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
        :amount => params[:amount_to_add].to_f,
        :customer_id => customer.customer_cim_id,
        :options => {
            :submit_for_settlement => true
        }
    )
    if result.success?
      logger.info "Added to #{params[:amount_to_add].to_f} to #{customer.first_name} #{customer.last_name} (#{customer.customer_cim_id})"
      customer.store_credit.add_credit(params[:amount_to_add].to_f)
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

end
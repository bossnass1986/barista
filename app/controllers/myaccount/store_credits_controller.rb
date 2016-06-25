class Myaccount::StoreCreditsController < Myaccount::BaseController

  def show
    @store_credit = customer.store_credit
  end

  def edit
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
      redirect_to myaccount_store_credit_path
      # , :notice => "Successfully updated store credit."
    else
      result.errors.each do |error|
        puts error.message
        customer.errors.add(:base, error.message)
        form_info
        render :show, :notice => error.message
      end
    end
  end

  private

  def customer
    @customer ||= User.includes(:store_credit).find(current_user.id)
  end


end
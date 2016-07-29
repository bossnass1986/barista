class Myaccount::PaymentMethodsController < Myaccount::BaseController
  def index
    # @payment_methods = PaymentMethod.where('user_id = ?', current_user)
    @customer = Braintree::Customer.find(current_user.customer_cim_id)
      # customer.payment_methods # array of PaymentMethod instances
      # puts customer.payment_methods.count
  end

  def show
    # @payment_method = current_user.payment_methods.find(params[:id])
  end

  def new
    @payment_method = current_user.payment_methods.new
  end

  def create
    result = Braintree::PaymentMethod.create(
        :customer_id => current_user.customer_cim_id,
        :payment_method_nonce => params[:payment_method_nonce],
        :cardholder_name => "#{current_user.first_name} #{current_user.last_name}",
        :options => {
            :make_default => true,
            :fail_on_duplicate_payment_method => true
        }
    )
    if result.success?
      customer = Braintree::Customer.find(current_user.customer_cim_id)
      puts customer.id
      puts customer.payment_methods[0].token
      params[:payment_methods][:payment_cim_id] = customer.id
      params[:payment_methods][:token] = customer.payment_methods[0].token
      # payment_method = Braintree::PaymentMethod.find(customer.payment_methods[0].token)
      # puts payment_method.cardholder_name
      # params[:payment_methods][:cardholder_name] = payment_method.cardholder_name
      # puts payment_method.card_type
      # params[:payment_methods][:card_type] = payment_method.card_type
      # puts payment_method.issuing_bank
      # params[:payment_methods][:issuing_bank] = payment_method.issuing_bank
      # puts payment_method.masked_number
      # params[:payment_methods][:masked_number] = payment_method.masked_number
      # puts payment_method.country_of_issuance
      # params[:payment_methods][:country_of_issuance] = payment_method.country_of_issuance
      # puts payment_method.expiration_month
      # params[:payment_methods][:month] = payment_method.expiration_month
      # puts payment_method.expiration_year
      # params[:payment_methods][:year] = payment_method.expiration_year
      # puts payment_method.expired?
      # params[:payment_methods][:active] = payment_method.expired?
    else
      # p result.errors
      result.errors.each do |error|
        # puts error.code
        puts error.message
      end
    end

    @payment_method = current_user.payment_methods.new(allowed_params)
    if @payment_method.save
      flash[:notice] = 'Successfully created credit card.'
      redirect_to myaccount_payment_methods_url
    else
      render :action => 'new'
    end
  end

  def edit
    @payment_method = current_user.payment_methods.find(params[:id])
  end

  def update
    @payment_method = current_user.payment_methods.find(params[:id])
    if @payment_method.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated credit card."
      redirect_to myaccount_credit_card_url(@payment_method)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @payment_method = current_user.payment_methods.find(params[:id])
    @payment_method.inactivate!
    flash[:notice] = "Successfully destroyed credit card."
    redirect_to myaccount_credit_cards_url
  end

  private

  def allowed_params
    params.require(:payment_methods).permit(:user_id, :payment_method_nonce, :address_id, :payment_cim_id, :token)
  end

end
class Profile::PaymentMethodsController < ApplicationController
  def index
    @customer = Braintree::Customer.find(current_user.customer_cim_id)
      # customer.payment_methods # array of PaymentMethod instances
      # puts customer.payment_methods.count
  end

  def show

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
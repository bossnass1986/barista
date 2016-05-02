class Myaccount::CreditCardsController < Myaccount::BaseController
  def index
    @credit_cards = current_user.payment_profiles
  end

  def show
    @credit_card = current_user.payment_profiles.find(params[:id])
  end

  def new
    @credit_card = current_user.payment_profiles.new
  end

  def create
    result = Braintree::PaymentMethod.create(
        :customer_id => current_user.customer_cim_id,
        :payment_method_nonce => 'fake-valid-amex-nonce',
        :cardholder_name => "#{current_user.first_name} #{current_user.last_name}",
        :options => {
            :make_default => true,
            # :fail_on_duplicate_payment_method_card => true
        }
    )
    if result.success?
      customer = Braintree::Customer.find(current_user.customer_cim_id)
      puts customer.id
      puts customer.payment_methods[0].token
      params[:payment_profile][:payment_cim_id] = customer.payment_methods[0].token
      payment_method = Braintree::PaymentMethod.find(customer.payment_methods[0].token)
      puts payment_method.cardholder_name
      params[:payment_profile][:cardholder_name] = payment_method.cardholder_name
      puts payment_method.card_type
      params[:payment_profile][:card_type] = payment_method.card_type
      puts payment_method.issuing_bank
      params[:payment_profile][:issuing_bank] = payment_method.issuing_bank
      puts payment_method.masked_number
      params[:payment_profile][:masked_number] = payment_method.masked_number
      puts payment_method.country_of_issuance
      params[:payment_profile][:country_of_issuance] = payment_method.country_of_issuance
      puts payment_method.expiration_month
      params[:payment_profile][:month] =  payment_method.expiration_month
      puts payment_method.expiration_year
      params[:payment_profile][:year] = payment_method.expiration_year
      puts payment_method.expired?
      params[:payment_profile][:active] = payment_method.expired?
    else
      p result.errors
    end

    @credit_card = current_user.payment_profiles.new(allowed_params)
    if @credit_card.save
      flash[:notice] = 'Successfully created credit card.'
      redirect_to myaccount_credit_card_url(@credit_card)
    else
      render :action => 'new'
    end
  end

  def edit
    @credit_card = current_user.payment_profiles.find(params[:id])
  end

  def update
    @credit_card = current_user.payment_profiles.find(params[:id])
    if @credit_card.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated credit card."
      redirect_to myaccount_credit_card_url(@credit_card)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @credit_card = current_user.payment_profiles.find(params[:id])
    @credit_card.inactivate!
    flash[:notice] = "Successfully destroyed credit card."
    redirect_to myaccount_credit_cards_url
  end

  private

  def allowed_params
    params.require(:payment_profile).permit(:user_id, :address_id, :payment_cim_id, :default, :active, :masked_number, :month, :year, :card_type, :cardholder_name, :country_of_issuance, :issuing_bank)
  end

end
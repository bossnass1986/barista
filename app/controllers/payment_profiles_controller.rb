class PaymentProfilesController < ApplicationController
  before_action :set_payment_profile, only: [:show, :edit, :update, :destroy]

  # GET /payment_profiles
  def index
    @payment_profiles = PaymentProfile.all
  end

  # GET /payment_profiles/1
  def show
  end

  # GET /payment_profiles/new
  def new
    @payment_profile = PaymentProfile.new
  end

  # GET /payment_profiles/1/edit
  def edit
  end

  # POST /payment_profiles
  def create
    @payment_profile = PaymentProfile.new(payment_profile_params)

    if @payment_profile.save
      redirect_to @payment_profile, notice: 'Payment profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /payment_profiles/1
  def update
    if @payment_profile.update(payment_profile_params)
      redirect_to @payment_profile, notice: 'Payment profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /payment_profiles/1
  def destroy
    @payment_profile.destroy
    redirect_to payment_profiles_url, notice: 'Payment profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_profile
      @payment_profile = PaymentProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_profile_params
      params.require(:payment_profile).permit(:user_id, :address_id, :payment_cim_id, :default, :active, :last_digits, :month, :year, :cc_type, :first_name, :last_name, :card_name)
    end
end

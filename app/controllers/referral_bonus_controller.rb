class ReferralBonusController < ApplicationController
  before_action :set_referral_bonu, only: [:show, :edit, :update, :destroy]

  # GET /referral_bonus
  def index
    referral_bonus = ReferralBonus.all
  end

  # GET /referral_bonus/1
  def show
  end

  # GET /referral_bonus/new
  def new
    referral_bonus = ReferralBonus.new
  end

  # GET /referral_bonus/1/edit
  def edit
  end

  # POST /referral_bonus
  def create
    referral_bonus = ReferralBonus.new(referral_bonu_params)

    if referral_bonus.save
      redirect_to referral_bonus, notice: 'Referral bonu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /referral_bonus/1
  def update
    if referral_bonus.update(referral_bonu_params)
      redirect_to referral_bonus, notice: 'Referral bonu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /referral_bonus/1
  def destroy
    referral_bonus.destroy
    redirect_to referral_bonus_url, notice: 'Referral bonu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_bonu
      referral_bonus = ReferralBonus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_bonu_params
      params.require(:referral_bonus).permit(:amount, :name)
    end
end

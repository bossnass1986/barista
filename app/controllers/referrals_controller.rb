class ReferralsController < ApplicationController
  before_action :set_referral, only: [:show, :edit, :update, :destroy]

  # GET /referrals
  def index
    @referrals = Referral.all
  end

  # GET /referrals/1
  def show
  end

  # GET /referrals/new
  def new
    @referral = Referral.new
  end

  # GET /referrals/1/edit
  def edit
  end

  # POST /referrals
  def create
    @referral = Referral.new(referral_params)

    if @referral.save
      redirect_to @referral, notice: 'Referral was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /referrals/1
  def update
    if @referral.update(referral_params)
      redirect_to @referral, notice: 'Referral was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /referrals/1
  def destroy
    @referral.destroy
    redirect_to referrals_url, notice: 'Referral was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral
      @referral = Referral.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_params
      params.require(:referral).permit(:applied, :clicked_at, :email, :name, :purchased_at, :referral_program_id, :referral_type_id, :referral_user_id, :referring_user_id, :registered_at, :sent_at)
    end
end

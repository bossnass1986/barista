class ReferralTypesController < ApplicationController
  before_action :set_referral_type, only: [:show, :edit, :update, :destroy]

  # GET /referral_types
  def index
    @referral_types = ReferralType.all
  end

  # GET /referral_types/1
  def show
  end

  # GET /referral_types/new
  def new
    @referral_type = ReferralType.new
  end

  # GET /referral_types/1/edit
  def edit
  end

  # POST /referral_types
  def create
    @referral_type = ReferralType.new(referral_type_params)

    if @referral_type.save
      redirect_to @referral_type, notice: 'Referral type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /referral_types/1
  def update
    if @referral_type.update(referral_type_params)
      redirect_to @referral_type, notice: 'Referral type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /referral_types/1
  def destroy
    @referral_type.destroy
    redirect_to referral_types_url, notice: 'Referral type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_type
      @referral_type = ReferralType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_type_params
      params.require(:referral_type).permit(:name)
    end
end

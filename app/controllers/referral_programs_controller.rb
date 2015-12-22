class ReferralProgramsController < ApplicationController
  before_action :set_referral_program, only: [:show, :edit, :update, :destroy]

  # GET /referral_programs
  def index
    @referral_programs = ReferralProgram.all
  end

  # GET /referral_programs/1
  def show
  end

  # GET /referral_programs/new
  def new
    @referral_program = ReferralProgram.new
  end

  # GET /referral_programs/1/edit
  def edit
  end

  # POST /referral_programs
  def create
    @referral_program = ReferralProgram.new(referral_program_params)

    if @referral_program.save
      redirect_to @referral_program, notice: 'Referral program was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /referral_programs/1
  def update
    if @referral_program.update(referral_program_params)
      redirect_to @referral_program, notice: 'Referral program was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /referral_programs/1
  def destroy
    @referral_program.destroy
    redirect_to referral_programs_url, notice: 'Referral program was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_program
      @referral_program = ReferralProgram.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_program_params
      params.require(:referral_program).permit(:active, :description, :name, :referral_bonus_id)
    end
end

class TaxRatesController < ApplicationController
  before_action :set_tax_rate, only: [:show, :edit, :update, :destroy]

  # GET /tax_rates
  def index
    @tax_rates = TaxRate.all
  end

  # GET /tax_rates/1
  def show
  end

  # GET /tax_rates/new
  def new
    @tax_rate = TaxRate.new
  end

  # GET /tax_rates/1/edit
  def edit
  end

  # POST /tax_rates
  def create
    @tax_rate = TaxRate.new(tax_rate_params)

    if @tax_rate.save
      redirect_to @tax_rate, notice: 'Tax rate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tax_rates/1
  def update
    if @tax_rate.update(tax_rate_params)
      redirect_to @tax_rate, notice: 'Tax rate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tax_rates/1
  def destroy
    @tax_rate.destroy
    redirect_to tax_rates_url, notice: 'Tax rate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_rate
      @tax_rate = TaxRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tax_rate_params
      params.require(:tax_rate).permit(:percentage, :state_id, :country_id, :start_date, :end_date, :active)
    end
end

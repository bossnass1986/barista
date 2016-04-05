class SupplierTradingHoursController < ApplicationController
  before_action :set_supplier_trading_hour, only: [:show, :edit, :update, :destroy]

  # GET /supplier_trading_hours
  def index
    @supplier_trading_hours = SupplierTradingHour.all
  end

  # GET /supplier_trading_hours/1
  def show
  end

  # GET /supplier_trading_hours/new
  def new
    @supplier_trading_hour = SupplierTradingHour.new
  end

  # GET /supplier_trading_hours/1/edit
  def edit
  end

  # POST /supplier_trading_hours
  def create
    @supplier_trading_hour = SupplierTradingHour.new(supplier_trading_hour_params)

    if @supplier_trading_hour.save
      redirect_to @supplier_trading_hour, notice: 'Supplier trading hour was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /supplier_trading_hours/1
  def update
    if @supplier_trading_hour.update(supplier_trading_hour_params)
      redirect_to @supplier_trading_hour, notice: 'Supplier trading hour was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /supplier_trading_hours/1
  def destroy
    @supplier_trading_hour.destroy
    redirect_to supplier_trading_hours_url, notice: 'Supplier trading hour was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_trading_hour
      @supplier_trading_hour = SupplierTradingHour.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_trading_hour_params
      params.require(:supplier_trading_hour).permit(:supplier_id, :weekday, :open_time, :close_time)
    end
end

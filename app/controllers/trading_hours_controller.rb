class TradingHoursController < ApplicationController
  before_action :set_supplier_trading_hour, only: [:show, :edit, :update, :destroy]

  # GET /trading_hours
  def index
    trading_hours = TradingHour.all
  end

  # GET /trading_hours/1
  def show
  end

  # GET /trading_hours/new
  def new
    trading_hour = TradingHour.new
  end

  # GET /trading_hours/1/edit
  def edit
  end

  # POST /trading_hours
  def create
    trading_hour = TradingHour.new(supplier_trading_hour_params)

    if trading_hour.save
      redirect_to trading_hour, notice: 'Merchant trading hour was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trading_hours/1
  def update
    if trading_hour.update(supplier_trading_hour_params)
      redirect_to trading_hour, notice: 'Merchant trading hour was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trading_hours/1
  def destroy
    trading_hour.destroy
    redirect_to supplier_trading_hours_url, notice: 'Merchant trading hour was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_supplier_trading_hour
    trading_hour = TradingHour.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def supplier_trading_hour_params
    params.require(:trading_hour).permit(:merchant_id, :weekday, :open_time, :close_time)
  end
end

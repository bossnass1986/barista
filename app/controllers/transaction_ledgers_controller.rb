class TransactionLedgersController < ApplicationController
  before_action :set_transaction_ledger, only: [:show, :edit, :update, :destroy]

  # GET /transaction_ledgers
  def index
    @transaction_ledgers = TransactionLedger.all
  end

  # GET /transaction_ledgers/1
  def show
  end

  # GET /transaction_ledgers/new
  def new
    @transaction_ledger = TransactionLedger.new
  end

  # GET /transaction_ledgers/1/edit
  def edit
  end

  # POST /transaction_ledgers
  def create
    @transaction_ledger = TransactionLedger.new(transaction_ledger_params)

    if @transaction_ledger.save
      redirect_to @transaction_ledger, notice: 'Transaction ledger was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transaction_ledgers/1
  def update
    if @transaction_ledger.update(transaction_ledger_params)
      redirect_to @transaction_ledger, notice: 'Transaction ledger was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transaction_ledgers/1
  def destroy
    @transaction_ledger.destroy
    redirect_to transaction_ledgers_url, notice: 'Transaction ledger was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_ledger
      @transaction_ledger = TransactionLedger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_ledger_params
      params.require(:transaction_ledger).permit(:accountable_type, :accountable_id, :transaction_id, :transaction_account_id, :tax_amount, :debit, :credit, :period)
    end
end

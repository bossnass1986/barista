require 'test_helper'

class TransactionLedgersControllerTest < ActionController::TestCase
  setup do
    @transaction_ledger = transaction_ledgers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_ledgers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_ledger" do
    assert_difference('TransactionLedger.count') do
      post :create, transaction_ledger: { accountable_id: @transaction_ledger.accountable_id, accountable_type: @transaction_ledger.accountable_type, credit: @transaction_ledger.credit, debit: @transaction_ledger.debit, period: @transaction_ledger.period, tax_amount: @transaction_ledger.tax_amount, transaction_account_id: @transaction_ledger.transaction_account_id, transaction_id: @transaction_ledger.transaction_id }
    end

    assert_redirected_to transaction_ledger_path(assigns(:transaction_ledger))
  end

  test "should show transaction_ledger" do
    get :show, id: @transaction_ledger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaction_ledger
    assert_response :success
  end

  test "should update transaction_ledger" do
    patch :update, id: @transaction_ledger, transaction_ledger: { accountable_id: @transaction_ledger.accountable_id, accountable_type: @transaction_ledger.accountable_type, credit: @transaction_ledger.credit, debit: @transaction_ledger.debit, period: @transaction_ledger.period, tax_amount: @transaction_ledger.tax_amount, transaction_account_id: @transaction_ledger.transaction_account_id, transaction_id: @transaction_ledger.transaction_id }
    assert_redirected_to transaction_ledger_path(assigns(:transaction_ledger))
  end

  test "should destroy transaction_ledger" do
    assert_difference('TransactionLedger.count', -1) do
      delete :destroy, id: @transaction_ledger
    end

    assert_redirected_to transaction_ledgers_path
  end
end

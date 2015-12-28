require 'test_helper'

class TransactionAccountsControllerTest < ActionController::TestCase
  setup do
    @transaction_account = transaction_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_account" do
    assert_difference('TransactionAccount.count') do
      post :create, transaction_account: { name: @transaction_account.name }
    end

    assert_redirected_to transaction_account_path(assigns(:transaction_account))
  end

  test "should show transaction_account" do
    get :show, id: @transaction_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaction_account
    assert_response :success
  end

  test "should update transaction_account" do
    patch :update, id: @transaction_account, transaction_account: { name: @transaction_account.name }
    assert_redirected_to transaction_account_path(assigns(:transaction_account))
  end

  test "should destroy transaction_account" do
    assert_difference('TransactionAccount.count', -1) do
      delete :destroy, id: @transaction_account
    end

    assert_redirected_to transaction_accounts_path
  end
end

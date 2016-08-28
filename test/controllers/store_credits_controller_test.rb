require 'test_helper'

class StoreCreditsControllerTest < ActionController::TestCase
  setup do
    @store_credit = store_credits(:one)
  end

  test "should get show" do
    get :show
    assert_response :success
    assert_not_nil assigns(:store_credits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_credit" do
    assert_difference('StoreCredit.count') do
      post :create, store_credit: { amount: @store_credit.amount, user_id: @store_credit.user_id }
    end

    assert_redirected_to store_credit_path(assigns(:store_credit))
  end

  test "should show store_credit" do
    get :show, id: @store_credit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_credit
    assert_response :success
  end

  test "should update store_credit" do
    patch :update, id: @store_credit, store_credit: { amount: @store_credit.amount, user_id: @store_credit.user_id }
    assert_redirected_to store_credit_path(assigns(:store_credit))
  end

  test "should destroy store_credit" do
    assert_difference('StoreCredit.count', -1) do
      delete :destroy, id: @store_credit
    end

    assert_redirected_to store_credits_path
  end
end

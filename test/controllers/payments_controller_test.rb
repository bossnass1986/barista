require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { action: @payment.action, amount: @payment.amount, confirmation_id: @payment.confirmation_id, error: @payment.error, error_code: @payment.error_code, invoice_id: @payment.invoice_id, message: @payment.message, params: @payment.params, success: @payment.success, test: @payment.test }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    patch :update, id: @payment, payment: { action: @payment.action, amount: @payment.amount, confirmation_id: @payment.confirmation_id, error: @payment.error, error_code: @payment.error_code, invoice_id: @payment.invoice_id, message: @payment.message, params: @payment.params, success: @payment.success, test: @payment.test }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
